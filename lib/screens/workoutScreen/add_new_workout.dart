// ignore_for_file: prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rich_pich_2/data/database.dart';
import 'package:rich_pich_2/screens/workoutScreen/wourkout_screen_main.dart';

class AddNewWorkout extends StatefulWidget {
  const AddNewWorkout({super.key});

  @override
  State<AddNewWorkout> createState() => _AddNewWorkoutState();
}

class _AddNewWorkoutState extends State<AddNewWorkout> {
  List<Widget> _columns = <Widget>[];
  final _myBox = Hive.openBox('myBox');
  final List<TextEditingController> _nameControllers =
      <TextEditingController>[];
  final List<TextEditingController> _repsControllers =
      <TextEditingController>[];
  final List<TextEditingController> _setsControllers =
      <TextEditingController>[];
  final List<Exercise> _exercises = <Exercise>[];
  TextEditingController _workoutNameController = TextEditingController();

  void _addWorkout() {
    final workoutName = _workoutNameController.text;

    final newExercises = _nameControllers.map((nameController) {
      final name = nameController.text;
      final reps = int.tryParse(
              _repsControllers[_nameControllers.indexOf(nameController)]
                  .text) ??
          0;
      final sets = int.tryParse(
              _setsControllers[_nameControllers.indexOf(nameController)]
                  .text) ??
          0;

      return Exercise(name: name, reps: reps, sets: sets);
    }).toList();

    final workout = Workout(name: workoutName, exercises: newExercises);

    final box = Hive.box<Workout>('workoutsBox');
    box.add(workout);

    _workoutNameController.clear();
    for (var controller in _nameControllers) {
      controller.clear();
    }
    for (var controller in _repsControllers) {
      controller.clear();
    }
    for (var controller in _setsControllers) {
      controller.clear();
    }
  }

  void addColumn() {
    setState(() {
      final nameController = TextEditingController();
      final repsController = TextEditingController();
      final setsController = TextEditingController();

      _nameControllers.add(nameController);
      _repsControllers.add(repsController);
      _setsControllers.add(setsController);

      _columns.add(Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: 400,
          height: 50,
          color: Colors.red,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Exercise Name', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: repsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Reps', border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: setsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Sets', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _workoutNameController, // Use the controller here
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Workout Name', border: InputBorder.none),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _columns.length,
              itemBuilder: (context, index) {
                return _columns[index];
              },
            ),
          ),
          TextButton(
              onPressed: () {
                _addWorkout(); 
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => Workouttrackermain()));
              },
              child: Text('Add Workout'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addColumn();
        },
        child: Text('Add Exercise'),
      ),
    );
  }
}
