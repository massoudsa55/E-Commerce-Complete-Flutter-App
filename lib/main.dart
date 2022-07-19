import 'package:e_commerce_complete_app/theme.dart';
import 'package:e_commerce_complete_app/utilities/router.dart';
import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.loginPage,
    );
  }
}
