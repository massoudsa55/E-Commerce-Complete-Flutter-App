import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase {
  final _firebaseauth = FirebaseAuth.instance;
  @override
  Stream<User?> authStateChanges() => _firebaseauth.authStateChanges();

  @override
  User? get currentUser => _firebaseauth.currentUser;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseauth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final userAuth = await _firebaseauth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }
}
