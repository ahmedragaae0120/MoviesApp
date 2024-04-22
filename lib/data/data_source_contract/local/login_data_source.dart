import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<Either<String,UserCredential>> login(
      {required String email, required String password});
}
