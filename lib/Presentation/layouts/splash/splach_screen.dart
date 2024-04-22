// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        checkAutoLogin();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(child: Image.asset('assets/images/movies.png')),
        );
      },
    );
  }

  Future<void> checkAutoLogin() async {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    if (provider.isFirebaseUserLoggedIn()) {
      await provider.retrieveDatabaseUserData();
      Navigator.pushReplacementNamed(context, Routes.homeRouteName,
          arguments: provider.dataBaseUser);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRouteName);
    }
  }
}
