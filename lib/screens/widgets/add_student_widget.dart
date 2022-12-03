// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo/db/db_functions/db_functions.dart';
import 'package:todo/db/model/student_model.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: onAddSudentButtonClicked,
                icon: const Icon(Icons.add),
                label: const Text("Add Student"),
              ),
              ElevatedButton.icon(
                onPressed: deleteAllStudents,
                icon: const Icon(Icons.add),
                label: const Text("Delete All Students"),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> onAddSudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    final _student = StudentModel(
      name: _name,
      age: _age,
    );
    addStudent(_student);
  }
}
