
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart'
    as auth;
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/models/user_model.dart';
import 'package:movies_app/domain/use_cases/Local/login_usecase.dart';
import 'package:provider/provider.dart';

@injectable
class loginViewModel extends Cubit<loginState> {
  @factoryMethod
  loginViewModel(this.loginUsecase) : super(loginInitState());

  LoginUsecase loginUsecase;
  static loginViewModel get(BuildContext context) => BlocProvider.of(context);
  login(String email, String password, BuildContext context) async {
    emit(loginLoadingState());
    var credential = await loginUsecase.call(email, password);
    credential.fold((error) => emit(loginErrorState(error)),
        (usercredential) async {
      auth.AuthProvider provider =
          Provider.of<auth.AuthProvider>(context, listen: false);
      try {
        UserModel? user =
            await FireStoreHelper.getUser(userId: usercredential.user!.uid);
        provider.setUsers(usercredential.user, user);
      } catch (e) {
        emit(loginErrorState(e.toString()));
      }
      emit(loginSuccessState(usercredential));
    });
  }
}

abstract class loginState {}

class loginInitState extends loginState {}

class loginLoadingState extends loginState {}

class loginErrorState extends loginState {
  String errorMessage;
  loginErrorState(this.errorMessage);
}

class loginSuccessState extends loginState {
  UserCredential usercredential;
  loginSuccessState(this.usercredential);
}
