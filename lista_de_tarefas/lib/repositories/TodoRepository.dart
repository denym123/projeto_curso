import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

const todoListKey = "TodoList";

class TodoRepository {

  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) {
    final jsonString = jsonEncode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}