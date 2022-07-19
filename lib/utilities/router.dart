import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/pages/Forgot%20Passourd/forgot_password.dart';
import 'package:e_commerce_complete_app/views/pages/Signup/signup_page.dart';
import 'package:e_commerce_complete_app/views/pages/landing_page.dart';
import 'package:e_commerce_complete_app/views/pages/login/login_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );
    case AppRoutes.loginPage:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );
    case AppRoutes.signupPage:
      return MaterialPageRoute(
        builder: (_) => const SignupPage(),
      );
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(
        builder: (_) => const ForgotPassword(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );
  }
}
