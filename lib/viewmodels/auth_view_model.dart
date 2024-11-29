import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? email;
  String? password;

  // Error message
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  // Function to handle sign-in
  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message; // Capture the error
      notifyListeners();
    }
  }

  // Function to handle sign-out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
