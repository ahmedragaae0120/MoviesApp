import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User? fireBaseUserAuth;
  UserModel?dataBaseUser;
  void setUsers(User? newFireBaseUserAuth, UserModel? newDataBaseUser) {
    fireBaseUserAuth = newFireBaseUserAuth;
    dataBaseUser = newDataBaseUser;
  }


  bool isFirebaseUserLoggedIn() {
    if (FirebaseAuth.instance.currentUser == null) return false;
    fireBaseUserAuth = FirebaseAuth.instance.currentUser;
    return true;
  }


  Future<void> retrieveDatabaseUserData() async {
    try {
      dataBaseUser =
          await FireStoreHelper.getUser(userId:fireBaseUserAuth!.uid);
          
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    fireBaseUserAuth = null;
    dataBaseUser = null;
    return await FirebaseAuth.instance.signOut();
  }

  bool isShowPasswordLogin = true;
  changeIsShowPassworLogin(bool newIsShowPassword) {
    if (isShowPasswordLogin == newIsShowPassword) return;
    isShowPasswordLogin = newIsShowPassword;
    notifyListeners();
  }
  
  bool isShowPasswordRegister = true;
  changeIsShowPasswordRegister(bool newIsShowPassword) {
    if (isShowPasswordRegister == newIsShowPassword) return;
    isShowPasswordRegister = newIsShowPassword;
    notifyListeners();
  }
}
