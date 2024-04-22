import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart'
    as auth;
import 'package:provider/provider.dart';

class AuthAndFirestoreViewmodel extends Cubit<AuthAndFirestoreState> {
  AuthAndFirestoreViewmodel() : super(InitalState());
  static AuthAndFirestoreViewmodel get(BuildContext context) =>
      BlocProvider.of(context);
  isfirebaseAuthUser({required BuildContext context}) {
    emit(AuthAndFirestoreLoadingState());
    if (FirebaseAuth.instance.currentUser == null) {
      emit(AuthAndFirestoreErrorState());
    }

    auth.AuthProvider provider =
        Provider.of<auth.AuthProvider>(context, listen: false);

    provider.fireBaseUserAuth = FirebaseAuth.instance.currentUser;
    provider.retrieveDatabaseUserData();
    log(provider.fireBaseUserAuth?.uid ?? "");
    log(provider.dataBaseUser?.email??"");
    emit(AuthAndFirestoreSuccessState());
  }
}

abstract class AuthAndFirestoreState {}

class InitalState extends AuthAndFirestoreState {}

class AuthAndFirestoreLoadingState extends AuthAndFirestoreState {}

class AuthAndFirestoreErrorState extends AuthAndFirestoreState {}

class AuthAndFirestoreSuccessState extends AuthAndFirestoreState {}
