import 'package:flutter/material.dart';

class TodoItem {
  String name;
  bool isDone;

  TodoItem({this.name, this.isDone = false});

  void isCompleted() {
    isDone = !isDone;
  }
}
// Kontruktor för att initera TodoItem instans

class TodoState extends ChangeNotifier {
  // Den vanliga listan
  List<TodoItem> _todoList = [];

  //  Hämtar den filtrerade listan
  List<TodoItem> get list => filterChoices(_todoList, _choice);
  // _todoList;

  String _choice = 'All';

  // String get choice => _choice;

  bool getDone(index) => list[index].isDone;

  void addItem(TodoItem item) {
    _choice = 'All';
    _todoList.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) {
    _todoList.remove(item);
    notifyListeners();
  }

  void setValue(index, bool isDone) {
    list[index].isCompleted();
    notifyListeners();
  }

  List<TodoItem> _filterList;

  List<TodoItem> filterChoices(List<TodoItem> _todoList, String _choice) {
    if (_choice == 'All') {
      _filterList = _todoList;
    } else if (_choice == 'Done') {
      _filterList = _todoList.where((item) => item.isDone == true).toList();
    } else if (_choice == 'Undone') {
      _filterList = _todoList.where((item) => item.isDone == false).toList();
    }
    return _filterList;
  }

  void setChoiceValue(String newChoice) {
    _choice = newChoice;
    notifyListeners();
  }

// Använd i popupMenuButton för att anropa filter
  filter() {
    notifyListeners();
    return filterChoices;
  }
}
