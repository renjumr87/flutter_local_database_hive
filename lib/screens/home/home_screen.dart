import 'package:flutter/material.dart';
import 'package:todo/db/db_functions/db_functions.dart';
import 'package:todo/screens/widgets/add_student_widget.dart';
import 'package:todo/screens/widgets/list_student_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: Column(
        children: <Widget>[
          AddStudent(),
          const Expanded(
            child: ListStudent(),
          )
        ],
      ),
    );
  }
}
