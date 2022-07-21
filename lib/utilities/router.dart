import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/pages/Forgot%20Passourd/forgot_password.dart';
import 'package:e_commerce_complete_app/views/pages/Home/home_page.dart';
import 'package:e_commerce_complete_app/views/pages/landing_page.dart';
import 'package:e_commerce_complete_app/views/pages/login/auth_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
    case AppRoutes.authPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.forgotPasswordRoute:
      return CupertinoPageRoute(
        builder: (_) => const ForgotPassword(),
        settings: settings,
      );
    case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
      );
  }
}
