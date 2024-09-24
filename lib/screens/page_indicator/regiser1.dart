// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconable_avatar/iconable_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:rich_pich_2/widgets/custom_textfield.dart';

class Regiser1 extends StatefulWidget {
  const Regiser1({super.key});

  @override
  State<Regiser1> createState() => _Regiser1State();
}

class _Regiser1State extends State<Regiser1> {
  File? selectedImage;

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void clearText(TextEditingController name) {
    setState(() {
      name.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> pickImageFromGallery() async {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnedImage != null) {
        setState(() {
          selectedImage = File(returnedImage.path);
        });
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'Rich Pich',
                    style: TextStyle(
                        fontSize: 40,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '\nSculpting Succes One Rep at a Time',
                    style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
              ]),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: pickImageFromGallery,
                child: IconableAvatar(
                  avatar: CircleAvatar(
                    radius: 80,
                    backgroundImage: selectedImage != null
                        ? FileImage(selectedImage!)
                        : AssetImage('assets/default_avatar.png')
                            as ImageProvider,
                  ),
                ),
              ),
            ),
            CustomTextField(
                name: _username,
                nama: 'Username',
                clearText: () {
                  clearText(_username);
                }),
            CustomTextField(
                name: _email,
                nama: 'Email',
                clearText: () {
                  clearText(_email);
                }),
            CustomTextField(
                name: _password,
                nama: 'Password',
                clearText: () {
                  clearText(_password);
                }),
          ],
        ),
      ),
    );
  }
}
