import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  String name;

  @HiveField(1)
  int reps;

  @HiveField(2)
  int sets;

  Exercise({required this.name, required this.reps, required this.sets});
}

@HiveType(typeId: 1)
class Workout {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<Exercise> exercises;

  Workout({required this.name, required this.exercises});
}
@HiveType(typeId: 2)
class ToDo {
  @HiveField(0)
  int? taskID;
  String? taskName;
  String? taskType;
  bool? status;
}
