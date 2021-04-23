import 'package:flutter/material.dart';
import 'package:todoey/screens/modify_task_screen.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskText;
  final int index;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.taskText, this.checkboxCallback, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => ModifyTaskScreen(index),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      },
    );
  }
}
