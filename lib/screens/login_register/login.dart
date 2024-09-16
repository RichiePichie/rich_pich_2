// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_super_parameters, deprecated_member_use

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
              CustomTextField(
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
              CustomTextField(
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
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Log in', style: TextStyle(fontWeight: FontWeight.bold),), style: ButtonStyle(),),
              SizedBox(
                height: 10,
              ),
              Text('Or log in with'),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                DesiredLogin(
                  DesiredIcon: FontAwesomeIcons.google,
                  DesiredText: 'Google',
                  DesiredColor: Colors.black,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
                DesiredLogin(
                  DesiredIcon: FontAwesomeIcons.apple,
                  DesiredText: 'Apple',
                  DesiredColor: const Color.fromARGB(54, 66, 66, 66),
                  textColor: Colors.black,
                  iconColor: Colors.black,
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Don't have an account? "),
                TextSpan(
                    text: 'Register',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
              SizedBox(
                height: 30,
              ),
            
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
  final Color DesiredColor;
  final Color textColor;
  final Color iconColor;
  const DesiredLogin({
    Key? key,
    required this.DesiredText,
    required this.DesiredIcon,
    required this.DesiredColor,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(DesiredColor),
        ),
        onPressed: () {},
        child: Row(
          children: [
            FaIcon(
              DesiredIcon,
              color: iconColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              DesiredText,
              style: TextStyle(color: textColor),
            )
          ],
        ));
  }
}
