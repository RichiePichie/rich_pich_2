// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors_in_immutables

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
