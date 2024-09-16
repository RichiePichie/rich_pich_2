// ignore_for_file: body_might_complete_normally_nullable, non_constant_identifier_names, prefer_final_fields, empty_catches

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
   Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential Credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Credential.user;
    } catch (e) {}
  }
}
