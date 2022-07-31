abstract class AuthBase{
  User? get currentUser;

  Stream<User?> authStateChanges();

  
}