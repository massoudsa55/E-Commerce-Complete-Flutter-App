import 'package:e_commerce_complete_app/theme.dart';
import 'package:e_commerce_complete_app/utilities/auth.dart';
import 'package:e_commerce_complete_app/utilities/router.dart';
import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
