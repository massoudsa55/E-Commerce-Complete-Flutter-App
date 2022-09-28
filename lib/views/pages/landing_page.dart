import 'package:e_commerce_complete_app/utilities/auth.dart';
import 'package:e_commerce_complete_app/views/pages/Home/home_page.dart';
import 'package:e_commerce_complete_app/views/pages/login/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Forgot Passourd/forgot_password.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return snapshot.hasData ? const ForgotPassword() : const AuthPage();
          default:
        }
        // TOTO: i will refactor this code
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
