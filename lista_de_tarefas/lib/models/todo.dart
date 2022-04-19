import 'dart:core';

import '../utils/contants.dart';

class Todo {
  Todo({required this.title, required this.dateTime});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json[Constants.TITLE],
        dateTime = DateTime.parse(json[Constants.DATETIME]);

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    return {
      Constants.TITLE: title,
      Constants.DATETIME: dateTime.toIso8601String(),
    };
  }
}
