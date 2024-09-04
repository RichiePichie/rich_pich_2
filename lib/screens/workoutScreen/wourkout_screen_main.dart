// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rich_pich_2/data/functions.dart';
import 'package:rich_pich_2/functions/push_to_next_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rich_pich_2/data/database.dart';
import 'package:rich_pich_2/screens/workoutScreen/widgets.dart';

class Workouttrackermain extends StatefulWidget {
  const Workouttrackermain({super.key});

  @override
  State<Workouttrackermain> createState() => _WorkouttrackermainState();
}

class _WorkouttrackermainState extends State<Workouttrackermain> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Workout>('workoutsBox');
    // final box = Hive.box<Exercise>('WorkoutBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracker'),
        centerTitle: true,
      ),
      body: Stack(children: [
        ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final workout = box.getAt(index) as Workout;
            return workoutWidget(workout: workout); // Pass workout here
          },
        ),
        TextButton(
            onPressed: () {
              deleteData();
            },
            child: Text('Delete workouts')),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushToNextScreen(context, 'addNewWorkout');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
