import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _loading = false;

  User? get user => _user;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      setLoading(true);
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw e.toString();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      setLoading(true);
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = result.user;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      setLoading(true);
      await _auth.signOut();
      _user = null;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw e.toString();
    }
  }
}
