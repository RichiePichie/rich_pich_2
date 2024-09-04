import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _userName,
            decoration: InputDecoration(
                hintText: 'Enter Your Username',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _userName.clear();
                      });
                    },
                    icon: Icon(Icons.clear))),
          ),
          TextField(
            controller: _email,
            decoration: InputDecoration(
                hintText: 'Enter Your Email',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _email.clear();
                      });
                    },
                    icon: Icon(Icons.clear))),
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
                hintText: 'Enter Your Password',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _password.clear();
                      });
                    },
                    icon: Icon(Icons.clear))),
          ),
        ],
      ),
    );
  }
}
