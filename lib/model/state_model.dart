import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/model/todo_types.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      isChecked: false,
      dateCreated: DateTime(2023, 3, 29),
      title: 'Zrobić zakupy',
      todoId: '861239',
      desc: 'Wejdz do lidla',
    ),
    Todo(
      isChecked: true,
      dateCreated: DateTime(2023, 3, 29),
      title: 'Zabrać bombelka z przedszkola',
      todoId: '861238',
      dateDue: DateTime(2023, 3, 31),
      desc: 'Przedszkole nr. 20 w Ostrołęce ty głupia pizdo',
    ),
    Todo(
      isChecked: false,
      dateCreated: DateTime(2023, 3, 29),
      title: 'Zejbać ci kopa',
      todoId: '861237',
      dateDue: DateTime(2023, 3, 31),
    ),
    Todo(
      isChecked: true,
      dateCreated: DateTime(2023, 3, 20),
      title: 'Super ci idzie',
      todoId: '861236',
      dateDue: DateTime(2023, 3, 24),
    ),
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);
  UnmodifiableListView<Todo> get todosComplete =>
      UnmodifiableListView(_todos.where((element) => element.isChecked));
  UnmodifiableListView<Todo> get todosNotComplete =>
      UnmodifiableListView(_todos.where((element) => !element.isChecked));

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
}
