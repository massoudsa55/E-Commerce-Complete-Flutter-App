import 'package:e_commerce_complete_app/controllers/auth_controller.dart';
import 'package:e_commerce_complete_app/utilities/auth.dart';
import 'package:e_commerce_complete_app/views/pages/Home/home_page.dart';
import 'package:e_commerce_complete_app/views/pages/login/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const AuthPage();
          }
          return const HomePage();
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
