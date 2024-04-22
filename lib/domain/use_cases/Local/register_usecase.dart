import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/local/register_repository.dart';

@injectable
class RegisterUsecase {
  RegisterRepository registerRepo;
  @factoryMethod
  RegisterUsecase(this.registerRepo);
  Future<Either<String, UserCredential>> call(String email, String password) {
    return registerRepo.register(email: email, password: password);
  }
}
