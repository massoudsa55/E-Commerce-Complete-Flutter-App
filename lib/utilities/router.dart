import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/pages/landing_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const LandingPage(),
      );
  }
}
