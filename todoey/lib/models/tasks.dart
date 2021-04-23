import 'package:flutter/foundation.dart';
import 'task.dart';

class Tasks with ChangeNotifier, DiagnosticableTreeMixin {
  List<Task> tasks = [];

  int get length => tasks.length;

  void addTask(String newTaskText) {
    tasks.add(new Task(taskText: newTaskText));
    notifyListeners();
  }

  void updateTaskState(int index) {
    tasks[index].changeStatus();
    notifyListeners();
  }

  void editTask(int index, String newTaskText) {
    tasks[index].changeText(newTaskText);
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  /// Makes `Tasks` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('tasks', tasks));
  }
}
