// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iconable_avatar/iconable_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rich_pich_2/functions/push_to_next_page.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:rich_pich_2/widgets/custom_textfield.dart';
import 'package:rich_pich_2/screens/page_indicator/main_register_form.dart';
import '../../user_auth/fireabase_auth_implementation/firebase_auth_services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _userName;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');
  String get username => _userName.text;
  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      // Save the username after successful registration
      saveUsername();

      print('User registered: ${userCredential.user!.email}');
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  void saveUsername() {
    final _myBox = Hive.box('myBox');
    _myBox.put('username', _userName.text);
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
            Text(''),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
