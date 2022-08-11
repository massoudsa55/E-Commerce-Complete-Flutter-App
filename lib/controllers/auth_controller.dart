import 'package:e_commerce_complete_app/utilities/auth.dart';
import 'package:e_commerce_complete_app/utilities/enums.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  String username;
  AuthFormType authFormType;
  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.username = '',
    this.authFormType = AuthFormType.login,
  });

  Future<void> submit() async {
    try {
      switch (authFormType) {
        case AuthFormType.login:
          await auth.loginWithEmailAndPassword(email, password);
          break;
        case AuthFormType.signup:
          await auth.signUpWithEmailAndPassword(email, password);
          break;
        default:
          break;
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.signup
        : AuthFormType.login;
    copyWith(
      email: "",
      password: "",
      username: "",
      authFormType: formType,
    );
    notifyListeners();
  }

  void updateEmail(String email) => copyWith(email: email);
  void updatePassword(String password) => copyWith(password: password);
  void updateUsername(String username) => copyWith(username: username);

  void copyWith({
    String? email,
    String? password,
    String? username,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.username = username ?? this.username;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
