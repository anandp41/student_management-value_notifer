import 'package:student_records/db/functions/db_functions.dart';
import 'package:student_records/db/model/data_model.dart';
import 'package:flutter/material.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: 'Name'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration:
                InputDecoration(border: OutlineInputBorder(), hintText: 'Age'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            ElevatedButton.icon(
                onPressed: () {
                  onAddStudentButtonClicked();
                },
                icon: Icon(Icons.add),
                label: Text('Add Student')),
          ])
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }

    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}
