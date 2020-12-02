import 'package:flutter/material.dart';
import 'Api.dart';

class TodoItem {
  String todoId;
  String name;
  bool isDone;

  TodoItem({this.name, this.isDone = false, this.todoId});

  void isCompleted() {
    isDone = !isDone;
  }

  static Map<String, dynamic> toJson(TodoItem item) {
    return {
      'title': item.name,
      'done': item.isDone,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      todoId: json['id'],
      name: json['title'],
      isDone: json['done'],
    );
  }
}

class TodoState extends ChangeNotifier {
  Future getList() async {
    List<TodoItem> todoList = await Api.getTodoData();
    _todoList = todoList;
    notifyListeners();
  }

  // Den vanliga listan
  List<TodoItem> _todoList = [];

  //  Hämtar den filtrerade listan
  List<TodoItem> get list => filterChoices(_todoList, _choice);
  // _todoList;

  String _choice = 'All';

  // String get choice => _choice;

  bool getDone(index) => list[index].isDone;

  void setValue(index, bool isDone) async {
    TodoItem item = list[index];

    item.isCompleted();
    Api.updateData(
      item,
      item.todoId,
    );
    notifyListeners();
  }

  getTodos(index) {
    if (list[index].isDone == false) {
      return Text(list[index].name,
          style: TextStyle(
            fontSize: 20,
          ));
    } else {
      return Text(
        list[index].name,
        style: TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.red[200],
          fontSize: 20,
        ),
      );
    }
  }

  void addItem(TodoItem item) async {
    await Api.postData(item);
    await getList();
  }

  void removeItem(TodoItem item) async {
    await Api.deleteData(item.todoId);
    await getList();
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
