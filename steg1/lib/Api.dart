import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;

class Api {
// API-key: 7caf8a64-2968-4860-94f9-6d136e087681

  // Lägga till data
  static Future postData(TodoItem item) async {
    var json = jsonEncode(TodoItem.toJson(item));
    await http.post(
      'https://todoapp-api-vldfm.ondigitalocean.app/todos?key=f41fb38b-35f6-48f9-b2a1-7b0ef7eecb52',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

//  Uppdatera data med id
  static Future updateData(TodoItem item, String todoId) async {
    var json = jsonEncode(TodoItem.toJson(item));
    await http.put(
      'https://todoapp-api-vldfm.ondigitalocean.app/todos/$todoId?key=f41fb38b-35f6-48f9-b2a1-7b0ef7eecb52',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

// Ta bort data med id
  static Future deleteData(String todoId) async {
    await http.delete(
        'https://todoapp-api-vldfm.ondigitalocean.app/todos/$todoId?key=f41fb38b-35f6-48f9-b2a1-7b0ef7eecb52');
  }

  static Future<List<TodoItem>> getTodoData() async {
    var response = await http.get(
        'https://todoapp-api-vldfm.ondigitalocean.app/todos?key=f41fb38b-35f6-48f9-b2a1-7b0ef7eecb52');
    var json = jsonDecode(response.body);
    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }
}
