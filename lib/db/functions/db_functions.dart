import 'package:sqflite/sqflite.dart';
import 'package:student_records/db/model/data_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;
Future<void> initializeDataBase() async {
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY,name TEXT,age TEXT)');
    },
  );
}

void addStudent(StudentModel value) async {
  _db.rawInsert(
      'INSERT INTO student(name,age)VALUES(?,?)', [value.name, value.age]);
  getAllStudents();
  // studentListNotifier.value.add(value);
}

Future<void> getAllStudents() async {
  studentListNotifier.value.clear();
  final values = await _db.rawQuery('SELECT * FROM student');
  print(values);
  // studentListNotifier.value.addAll(studentDB.values);
  // studentListNotifier.notifyListeners();
}

// Future<void> deleteStudent(int id) async {
//   getAllStudents();
// }
