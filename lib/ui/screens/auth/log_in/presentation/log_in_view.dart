 import 'package:atw_ltd_task/domain/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atw_ltd_task/ui/screens/auth/log_in/logic/log_in_view_model.dart';
import 'package:atw_ltd_task/ui/utils/base_request_states.dart';
import 'package:atw_ltd_task/ui/screens/auth/log_in/presentation/widget/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = getIt();

    return Scaffold(
      body: BlocListener<LoginViewModel, BaseRequestStates>(
        bloc: viewModel,
        listener: (context, state) {
          // Handle different states
          if (state is BaseRequestLoadingState) {
            // Show loading dialog
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Prevent manual dismissal of the dialog
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            // Ensure the dialog is dismissed if it's open
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          }

          // Handle error state
          if (state is BaseRequestErrorState) {
            // Show error message in SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

          // Handle success state
          if (state is BaseRequestSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Log In Successfully")),
            );
            // Navigate to the home page on success
            Navigator.pushReplacementNamed(context, '/home');
          }
        },

          child: SafeArea(child: LogInViewBody(viewModel: viewModel)),

      ),
    );
  }
}
