import 'package:flutter/material.dart';

class TodoItem {
  String name;
  bool done;

  TodoItem({this.name, this.done = false});

  void toggleDone() {
    done = !done;
  }
}
// Kontruktor för att initera TodoItem instans

class TodoState extends ChangeNotifier {
  List<TodoItem> _todoList = [];
  List<TodoItem> get list => _todoList;
  void addItem(TodoItem item) {
    _todoList.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _todoList.remove(index);
    notifyListeners();
  }

  void toggleTodo(TodoItem item) {
    final taskIndex = _todoList.indexOf(item);
    _todoList[taskIndex].toggleDone();
    notifyListeners();
  }
}
