import 'package:flutter/material.dart';
import 'package:rich_pich_2/data/database.dart';
import 'package:rich_pich_2/screens/workoutScreen/workout_widget.dart';
class workoutWidget extends StatelessWidget {
  final Workout workout; // Accept Workout object

  const workoutWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to WorkoutDetails screen and pass the workout
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutDetails(workout: workout),
            ),
          );
        },
        child: Container(
          width: 300,
          height: 50,
          color: const Color.fromARGB(255, 172, 166, 202),
          child: Center(child: Text(workout.name)),
        ),
      ),
    );
  }
}
