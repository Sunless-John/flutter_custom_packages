part of firebase_auth_repo;

class AppUser {
  const AppUser({
    required this.uid,
    this.email,
    this.photoURL,
    this.displayName,
  });

  final String uid;
  final String? email;
  final String? photoURL;
  final String? displayName;

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }

  @override
  String toString() => 'uid: $uid, email: $email, photoUrl: $photoURL, displayName: $displayName';
}

