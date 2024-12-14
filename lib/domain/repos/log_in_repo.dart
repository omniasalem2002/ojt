import 'package:either_dart/either.dart';

abstract class LogInRepo {
  Future<Either<String, bool>> login(String email, String password);
}
