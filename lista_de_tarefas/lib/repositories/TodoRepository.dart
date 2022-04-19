import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';
import '../utils/contants.dart';

class TodoRepository {

  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(Constants.TODOLISTKEY) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) {
    final jsonString = jsonEncode(todos);
    sharedPreferences.setString(Constants.TODOLISTKEY, jsonString);
  }
}