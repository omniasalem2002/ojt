import 'package:firebase_auth/firebase_auth.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:atw_ltd_task/data/models/requests/log_in_request_body.dart';
import 'package:atw_ltd_task/domain/repos/auth_repo/data_sources/log_in_data_source.dart';

@injectable
class LogInDataSourceImpl extends LogInDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<String, bool>> logIn(LoginRequestBody loginRequestBody) async {
    try {
      final email = loginRequestBody.email?.trim() ?? '';
      final password = loginRequestBody.password ?? '';

      if (email.isEmpty || password.isEmpty) {
        return const Left('Email and password cannot be empty.');
      }

      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final idToken = await userCredential.user?.getIdToken() ?? '';
      if (idToken.isNotEmpty) {
        if (kDebugMode) print('User ID Token: $idToken'); // Debug log
      }

      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) print("Firebase Auth Error Code: ${e.code}");
      return Left(_mapFirebaseErrorCodeToMessage(e.code));
    } catch (e) {
      if (kDebugMode) print('Unexpected error: $e');
      return Left('An unexpected error occurred: $e');
    }
  }

  String _mapFirebaseErrorCodeToMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Please provide a valid email address.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'Authentication error. Please try again later.';
    }
  }
}
