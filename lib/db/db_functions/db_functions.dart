// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/db/model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

// Add data to the database
Future<void> addStudent(StudentModel studentModel) async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  final _id = await studentDB.add(studentModel);
  studentModel.id = _id;
  // studentListNotifier.value.add(studentModel);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

// Delete Data from Database

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  await studentDB.delete(id);
  getAllStudents();
// }
}

Future<void> deleteAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  await studentDB.clear();
  getAllStudents();
}
