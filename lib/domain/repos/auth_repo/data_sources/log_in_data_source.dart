import 'package:atw_ltd_task/data/models/requests/log_in_request_body.dart';
import 'package:either_dart/either.dart';

abstract class LogInDataSource {
  Future<Either<String, bool>> logIn(LoginRequestBody loginRequestBody);
}
