// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rich_pich_2/functions/push_to_next_page.dart';
import 'package:rich_pich_2/user_auth/fireabase_auth_implementation/firebase_auth_services.dart';

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

 Future<void> register() async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
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
            TextButton(onPressed: (){register();pushToNextScreen(context, 'HomePage');}, child: Text('Next')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController name; // Use final for the controller
  final String nama;
  final VoidCallback clearText;

  CustomTextField({
    super.key,
    required this.name,
    required this.nama,
    required this.clearText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 10),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextField(
          controller: name,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 10),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: nama,
            suffix: IconButton(
              onPressed: clearText,
              icon: Icon(
                Icons.clear,
                size: 18,
              ),
            ),
            contentPadding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
