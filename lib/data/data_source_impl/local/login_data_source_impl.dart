import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/FirebaseAuthErorrCodes.dart';
import 'package:movies_app/core/firebase/auth_helper.dart';
import 'package:movies_app/data/data_source_contract/local/login_data_source.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  AuthHelper authHelper;
  @factoryMethod
  LoginDataSourceImpl(this.authHelper);
  @override
  Future<Either<String, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      UserCredential credential =
          await authHelper.login(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthErorrCodes.usernotfound) {
        return const Left('No user found for that email.');
      } else if (e.code == FirebaseAuthErorrCodes.wrongPassword) {
        return const Left('Wrong password provided for that user.');
      }
    } catch (e) {
      return Left(e.toString());
    }
    return const Left("");
  }
}
