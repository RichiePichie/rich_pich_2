import 'package:flutter/material.dart';
import 'package:rich_pich_2/data/database.dart';

class WorkoutDetails extends StatelessWidget {
  final Workout workout;

  const WorkoutDetails({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: ListView.builder(
        itemCount: workout.exercises.length,
        itemBuilder: (context, index) {
          final exercise = workout.exercises[index];
          return ListTile(
            title: Text(exercise.name),
            subtitle: Text('Reps: ${exercise.reps}, Sets: ${exercise.sets}'),
          );
        },
      ),
    );
  }
}
