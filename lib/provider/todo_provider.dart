import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/model/todo_types.dart';
import 'package:todo/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _service = TodoService();

  bool loading = false;

  List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);
  UnmodifiableListView<Todo> get todosComplete =>
      UnmodifiableListView(_todos.where((element) => element.isChecked));
  UnmodifiableListView<Todo> get todosNotComplete =>
      UnmodifiableListView(_todos.where((element) => !element.isChecked));
  bool get isLoading => loading;

  void add(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.removeWhere((element) => element.todoId == todo.todoId);

    notifyListeners();
  }

  void update(Todo todo) {
    final index = _todos.indexWhere((element) => element.todoId == todo.todoId);
    _todos[index] = todo;

    notifyListeners();
  }

  Future<void> getAllTodos() async {
    _todos = [];
    loading = true;
    notifyListeners();

    final response = await _service.getAll();
    _todos = response;

    loading = false;
    notifyListeners();
  }
}
