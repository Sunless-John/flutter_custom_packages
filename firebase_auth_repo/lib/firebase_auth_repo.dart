library firebase_auth_repo;

import 'package:firebase_auth/firebase_auth.dart';

part 'app_user.dart';

class FirebaseAuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<AppUser?> get authStateChanges =>
      _firebaseAuth.authStateChanges().map((user) => user != null ? AppUser.fromFirebaseUser(user) : null);

  // Future<AppUser> signInAnonymously() async {
  //   final userCredential = await _firebaseAuth.signInAnonymously();
  //   return AppUser.fromFirebaseUser(userCredential.user);
  // }

  Future<AppUser?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(EmailAuthProvider.credential(
        email: email,
        password: password,
      ));
      return userCredential.user != null ? AppUser.fromFirebaseUser(userCredential.user!) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser?> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user != null ? AppUser.fromFirebaseUser(userCredential.user!) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  AppUser? get currentUser =>
      _firebaseAuth.currentUser != null ? AppUser.fromFirebaseUser(_firebaseAuth.currentUser!) : null;

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
