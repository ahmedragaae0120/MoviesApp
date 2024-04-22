import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/Local/register_usecase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  @factoryMethod
  RegisterViewModel(this.registerUsecase) : super(RegisterinitState());
  static RegisterViewModel get(BuildContext context) =>
      BlocProvider.of(context);
  RegisterUsecase registerUsecase;
  register(String email, String password) async {
    emit(RegisterLoadingState());
    var credential = await registerUsecase.call(email, password);
    credential.fold((error) => emit(RegisterErrorState(error)),
        (usercredential) => emit(RegisteSuccessState(usercredential)));
  }
}

abstract class RegisterState {}

class RegisterinitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String errorMessage;
  RegisterErrorState(this.errorMessage);
}

class RegisteSuccessState extends RegisterState {
  UserCredential usercredential;
  RegisteSuccessState(this.usercredential);
}
