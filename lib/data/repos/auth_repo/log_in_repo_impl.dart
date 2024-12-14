import 'package:atw_ltd_task/data/models/requests/log_in_request_body.dart';
import 'package:atw_ltd_task/data/repos/auth_repo/data_sources/log_in_data_source_impl.dart';
import 'package:atw_ltd_task/domain/repos/log_in_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

@Injectable(as: LogInRepo)
class LogInRepoImpl extends LogInRepo {
  final LogInDataSourceImpl onlineDataSource;
  Connectivity connectivity = Connectivity();

  LogInRepoImpl(this.onlineDataSource, this.connectivity);

  @override
  Future<Either<String, bool>> login(String email, String password) async {
    final loginRequestBody = LoginRequestBody(
      email: email.trim(),
      password: password,
    );

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const Left(
          "No internet connection. Please check your network and try again.");
    }

    // Verify actual internet access
    if (!await _hasInternetAccess()) {
      return const Left(
          "No internet access. Please check your network and try again.");
    }

    try {
      return await onlineDataSource.logIn(loginRequestBody);
    } catch (e) {
      return const Left(
          "An unexpected error occurred. Please try again later.");
    }
  }

  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }
}
