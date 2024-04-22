import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/local/register_data_source.dart';
import 'package:movies_app/domain/repository_contract/local/register_repository.dart';

@Injectable(as: RegisterRepository)
class registerRepositoryImpl extends RegisterRepository {
  RegisterDataSource registerDataSource;
  @factoryMethod
  registerRepositoryImpl({required this.registerDataSource});
  @override
  Future<Either<String, UserCredential>> register(
      {required String email, required String password}) async {
    var credential =
        await registerDataSource.register(email: email, password: password);
    return credential.fold((error) => Left(error), (usercredential) => Right(usercredential));
  }
}
