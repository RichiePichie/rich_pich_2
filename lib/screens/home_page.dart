// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rich_pich_2/functions/push_to_next_page.dart';
import 'package:rich_pich_2/widgets/header.dart';
import 'package:rich_pich_2/widgets/to_do_homescreen.dart';
import 'package:rich_pich_2/widgets/trackers.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? userId;
  late DocumentReference userDoc;

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      userDoc = firestore.collection('users').doc(userId);
      fetchUserData();
    } else {
      print("User not logged in");
    }
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot documentSnapshot = await userDoc.get();
      if (documentSnapshot.exists) {
        var userData = documentSnapshot.data();
        // Use userData as needed
        print("User data: $userData");
      } else {
        // Handle the case where the document doesn't exist
        print("User document does not exist");
      }
    } catch (error) {
      // Handle errors
      print("Error fetching user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopOne(),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Tracker(
                    icon: Icon(Icons.fitness_center),
                    trackerName: 'Workout Tracker',
                  ),
                  onTap: () => pushToNextScreen(context, 'Workout Tracker'),
                ),
                Tracker(
                    icon: Icon(Icons.menu_book),
                    trackerName: 'Journal tracker'),
              ],
            ),
            SizedBox(height: 20),
            ToDo(icon: Icon(Icons.add_task_sharp), name: 'To Do List')
          ],
        ),
      ),
    );
  }
}
