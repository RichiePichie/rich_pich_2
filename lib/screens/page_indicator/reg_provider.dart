import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegData {
  String? email;
  String? password;
  String? username;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': username,
    };
  }
}

class RegProvider with ChangeNotifier {
  final RegData _data = RegData();

  void updateEmail(String email) {
    _data.email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _data.password = password;
    notifyListeners();
  }

  void updateUsername(String username) {
    _data.username = username;
    notifyListeners();
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _data.email!,
        password: _data.password!,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(_data.toMap());
      // Registration successful
      print('User registered: ${userCredential.user!.email}');

      // Navigate to the home page

      // pushToNextScreen(context, 'HomePage'); // Replace '/home' with your actual route name
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}
