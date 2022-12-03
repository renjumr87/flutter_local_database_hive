import 'package:flutter/material.dart';
import 'package:todo/db/db_functions/db_functions.dart';
import 'package:todo/db/model/student_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  if (data.id != null) {
                    deleteStudent(data.id!);
                  } else {
                    print("id is null");
                  }
                },
                color: Colors.redAccent,
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
