// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rich_pich_2/screens/home_page.dart';
import 'package:rich_pich_2/screens/workoutScreen/add_new_workout.dart';
// import 'package:rich_pich_2/screens/workoutTracker/workout.dart';
import 'package:rich_pich_2/screens/workoutScreen/wourkout_screen_main.dart';

void pushToNextScreen(BuildContext context, String routeName) {
  final Map<String, WidgetBuilder> routes = {
    'Workout Tracker': (context) => Workouttrackermain(),
    // 'Journal Tracker': (context) => MyForm(),
    // 'To Do List': (context) => MyForm(),
    'addNewWorkout': (context) => AddNewWorkout(),
    // 'desiredWorkout': (context) => Workout(),
    'HomePage': (context) => HomePage(),
  };

  final screenBuilder = routes[routeName];

  if (screenBuilder != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: screenBuilder),
    );
  } else {}
}

final PageController pageController = PageController();
void nextPage() {
  pageController.nextPage(
      duration: Duration(milliseconds: 300), curve: Curves.easeInBack);
}
