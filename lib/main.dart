// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rich_pich_2/screens/page_indicator/main_register_form.dart';
import 'package:rich_pich_2/screens/home_page.dart';
import 'package:rich_pich_2/data/database.dart';
import 'package:rich_pich_2/screens/login_register/login.dart';
import 'package:rich_pich_2/screens/login_register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rich_pich_2/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(WorkoutAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var box = Hive.box('myBox');
  await Hive.openBox<Exercise>('exercisesBox');
  await Hive.openBox<Workout>('workoutsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SafeArea(
          child: PageIndicator(),
        ));
  }
}
