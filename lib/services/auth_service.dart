import 'package:firebase_auth/firebase_auth.dart';

final AuthService authService = AuthService();

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCred.user!.updateDisplayName(username);
    await userCred.user!.reload();

    return userCred;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUserName({required String username}) async {
    await currentUser!.updateDisplayName(username);
  }
}
