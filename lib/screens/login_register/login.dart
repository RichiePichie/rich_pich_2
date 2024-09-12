// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rich_pich_2/screens/login_register/register.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _username;
  late final TextEditingController _password;
  @override
  void initState() {
    _password = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _username.dispose();
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
        child: Center(
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
                height: 20,
              ),
              Text(
                'Enter Your Details Below',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              CutsomTextField(
                  name: _username,
                  nama: 'Username',
                  clearText: () {
                    clearText(_username);
                  }),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text('Forgot Username?'))
              ]),
              SizedBox(
                height: 10,
              ),
              CutsomTextField(
                  name: _password,
                  nama: 'Password',
                  clearText: () {
                    clearText(_password);
                  }),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text('Forgot Password?'))
              ]),
              SizedBox(
                height: 60,
              ),
              Text('Or log in with'),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                DesiredLogin(
                    DesiredIcon: FontAwesomeIcons.google, DesiredText: 'Google')
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class DesiredLogin extends StatelessWidget {
  final String DesiredText;
  final IconData DesiredIcon;

  const DesiredLogin({
    Key? key,
    required this.DesiredText,
    required this.DesiredIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonIcon(
      onPressed: () {},
      icon: FaIcon(
        DesiredIcon,
        size: 30,
      ),
    );
  }
}
