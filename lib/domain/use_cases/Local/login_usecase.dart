import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/local/login_repository.dart';

@injectable
class LoginUsecase {
  LoginRepository loginRepo;
  @factoryMethod
  LoginUsecase(this.loginRepo);
  Future<Either<String, UserCredential>> call(String email, String password) {
    return loginRepo.login(email: email, password: password);
  }
}
