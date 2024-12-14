import 'package:atw_ltd_task/domain/repos/log_in_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  LogInRepo repo;

  LoginUseCase(this.repo);

  Future<Either<String, bool>> execute(String email, String password) {
    return repo.login(email, password);
  }
}
