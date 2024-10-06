import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rich_pich_2/data/database.dart';

final _myBox = Hive.box('myBox');
void saveData() {
  _myBox.put('exerciseName', '');
}

void deleteData() {
  final exercisesBox = Hive.box<Exercise>('exercisesBox');
  exercisesBox.clear();
}

void saveUsername() {
  _myBox.put('username', '');
}
