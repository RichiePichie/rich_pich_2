// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, non_constant_identifier_names, use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
