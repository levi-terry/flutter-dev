import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          //taskText: widget.tasks[index].name,
          taskText: context.watch<Tasks>().tasks[index].taskText,
          isChecked: context.watch<Tasks>().tasks[index].isDone,
          checkboxCallback: (checkboxState) {
            context.read<Tasks>().updateTaskState(index);
          },
          index: index,
        );
      },
      itemCount: context.watch<Tasks>().length,
    );
  }
}
