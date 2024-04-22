import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepository  {
    Future<Either<String, UserCredential>> register({
    required String email,
    required String password,
  });
}