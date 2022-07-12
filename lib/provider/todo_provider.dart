import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];
  addToDo(title, descrieption) {
    var newTodo = Todo(title: title, descrieption: descrieption);
    todos.add(newTodo);
    notifyListeners();
  }

  delete(index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
