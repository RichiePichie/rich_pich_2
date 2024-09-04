// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconable_avatar/iconable_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rich_pich_2/functions/part_of_day.dart';

class TopOne extends StatefulWidget {
  const TopOne({super.key});

  @override
  State<TopOne> createState() => _TopOneState();
}

class _TopOneState extends State<TopOne> {
  File? selectedImage;

  Future<void> pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      setState(() {
        selectedImage = File(returnedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;
    String date = formatDateAsString(day, month, year);
    String partOfDay = getPartOfDay(now.hour);
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 110, 109, 108),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
              boxShadow: [BoxShadow(spreadRadius: 7, color: Colors.grey.withOpacity(0.9))]
              ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Welcome back',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(' $date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
                Icon(
                  Icons.notifications,
                  size: 27,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: pickImageFromGallery,
                      child: IconableAvatar(
                        avatar: CircleAvatar(
                          radius: 50,
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!)
                              : AssetImage('assets/default_avatar.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 40),
                    child: Text(
                      'Good $partOfDay, Richard',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
