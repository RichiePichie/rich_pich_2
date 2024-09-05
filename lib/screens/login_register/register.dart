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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CutsomTextField(name: _userName, nama: "Username"),
          CutsomTextField(name: _email, nama: "Email"),
          CutsomTextField(name: _password, nama: "Password"),
        ],
      ),
    );
  }
}

class CutsomTextField extends StatelessWidget {
  TextEditingController name = TextEditingController();
  String nama;
  CutsomTextField({super.key, required this.name, required this.nama});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: name,
      decoration: InputDecoration(
          hintText: 'Enter Your $nama',
          suffix: IconButton(onPressed: () {}, icon: Icon(Icons.clear))),
    );
  }
}
