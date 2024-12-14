import 'package:atw_ltd_task/domain/use_cases/log_in_use_case.dart';
import 'package:atw_ltd_task/ui/utils/base_request_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<BaseRequestStates> {
  LoginViewModel(this.useCase) : super(BaseRequestInitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginUseCase useCase;

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    emit(BaseRequestLoadingState());

    Either<String, bool> eitherResponse =
        await useCase.execute(emailController.text, passwordController.text);

    eitherResponse.fold(
      (error) {
        emit(BaseRequestErrorState(error));
      },
      (success) {
        emit(BaseRequestSuccessState());
      },
    );
  }
}
