import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/local/login_data_source.dart';
import 'package:movies_app/domain/repository_contract/local/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;
  @factoryMethod
  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<Either<String, UserCredential>> login(
      {required String email, required String password}) async {
    var credenetial =
        await loginDataSource.login(email: email, password: password);
    return credenetial.fold(
        (error) => Left(error), (usercredenetial) => Right(usercredenetial));
  }
}
