class Task {
  String taskText;
  bool isDone;

  Task({this.taskText, this.isDone = false});

  void changeStatus() {
    isDone = !isDone;
  }

  void changeText(String newText) {
    taskText = newText;
  }
}
