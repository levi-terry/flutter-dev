import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks.dart';

class ModifyTaskScreen extends StatefulWidget {
  final int index;

  ModifyTaskScreen(this.index);

  @override
  _ModifyTaskScreenState createState() => _ModifyTaskScreenState();
}

class _ModifyTaskScreenState extends State<ModifyTaskScreen> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(
        text: context.read<Tasks>().tasks[widget.index].taskText);
  }

  @override
  Widget build(BuildContext context) {
    String newTaskText;

    return Container(
      child: Container(
        height: 340,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              topRight: Radius.circular(
                20,
              )),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Edit Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: kUnderlineBorder,
                focusedBorder: kUnderlineBorder,
                border: kUnderlineBorder,
              ),
              controller: _textEditingController,
              onChanged: (newText) {
                newTaskText = newText;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () {
                  if (newTaskText != null) {
                    context.read<Tasks>().editTask(widget.index, newTaskText);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Saved Changes",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TextButton(
                onPressed: () {
                  context.read<Tasks>().deleteTask(widget.index);
                  Navigator.pop(context);
                },
                child: Text(
                  "Delete Task",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
