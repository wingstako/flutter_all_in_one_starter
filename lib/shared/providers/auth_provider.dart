import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_starter/shared/models/user_profile.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated, registering }

class AuthProvider extends ChangeNotifier {
  late FirebaseAuth _auth;

  Status _status = Status.uninitialized;

  Status get status => _status;

  Stream<UserProfile> get user => _auth.authStateChanges().map(_userFromFirebase);

  UserProfile getUserSnapshot() => _userFromFirebase(_auth.currentUser);

  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen(onAuthStateChanged);
  }

  UserProfile _userFromFirebase(User? user) {
    if (user == null) {
      return UserProfile(displayName: 'Null', uid: 'null', email: '');
    }

    return UserProfile(
        uid: user.uid, email: user.email ?? "", displayName: user.displayName ?? "", photoUrl: user.photoURL);
  }

  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  Future<UserProfile> registerWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.registering;
      notifyListeners();
      final UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return _userFromFirebase(result.user);
    } catch (e) {
      print("Error on the new user registration = " + e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return UserProfile(displayName: 'Null', uid: 'null', email: '');
    }
  }

  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print("Error on the sign in = " + e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Method to handle password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
