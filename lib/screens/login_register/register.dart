// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rich_pich_2/functions/push_to_next_page.dart';
import 'package:rich_pich_2/user_auth/fireabase_auth_implementation/firebase_auth_services.dart';
import 'package:rich_pich_2/widgets/custom_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _userName;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      // Registration successful
      print('User registered: ${userCredential.user!.email}');

      // Navigate to the home page

      // pushToNextScreen(context, 'HomePage'); // Replace '/home' with your actual route name
    } catch (e) {
      print('Error registering user: $e');
      // Handle error, e.g., show an error message to the user
    }
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _userName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _userName.dispose();
    super.dispose();
  }

  void clearText(TextEditingController name) {
    setState(() {
      name.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Rich Pich',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text(
              'Sculpting Success, One Rep at a Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Enter Your Details Below',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              name: _userName,
              nama: "Username",
              clearText: () {
                clearText(_userName);
              },
            ),
            CustomTextField(
              name: _email,
              nama: "Email",
              clearText: () {
                clearText(_email);
              },
            ),
            CustomTextField(
              name: _password,
              nama: "Password",
              clearText: () {
                clearText(_password);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextButton(
                onPressed: () {
                  user.add({
                    'username': _userName.text,
                    'email': _email.text,
                    'password': _password.text,
                  });
                  register();
                  pushToNextScreen(context, 'HomePage');
                },
                child: Text('Next')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
