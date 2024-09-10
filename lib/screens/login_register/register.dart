// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _userName;

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
            CutsomTextField(
                name: _userName,
                nama: "Username",
                clearText: () {
                  clearText(_userName);
                }),
            CutsomTextField(
              name: _email,
              nama: "Email",
              clearText: () {
                clearText(_email);
              },
            ),
            CutsomTextField(
              name: _password,
              nama: "Password",
              clearText: () {
                clearText(_password);
              },
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              child: Center(
                  child: Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Need help? Visit our '),
              TextSpan(text: 'help center', style: TextStyle(fontWeight: FontWeight.bold) ),
            ]))
          ],
        ),
      ),
    );
  }
}

class CutsomTextField extends StatelessWidget {
  TextEditingController name = TextEditingController();
  String nama;
  final VoidCallback clearText;
  CutsomTextField(
      {super.key,
      required this.name,
      required this.nama,
      required this.clearText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 20),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextField(
          controller: name,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 10),
                  borderRadius: BorderRadius.circular(10)),
              hintText: '$nama',
              suffix: IconButton(
                onPressed: () {
                  clearText();
                },
                icon: Icon(
                  Icons.clear,
                  size: 18,
                ),
              ),
              contentPadding: EdgeInsets.all(15)),
        ),
      ),
    );
  }
}
