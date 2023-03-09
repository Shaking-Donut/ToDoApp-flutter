import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:todo/model/todo_types.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = 'http://192.168.1.3:8080/api/todo';
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDlmODM4ZjhkNDU4YzhhMmRmNzFhOSIsImxvZ2luIjoia2FjcGVyIiwiaWF0IjoxNjc4Mzc1MDM3LCJleHAiOjE2ODA5NjcwMzd9.wma5omFLW4MccUFXDSzrMMm7bqTcOB6FADQN9kqTiec'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
          isChecked: e['completed'],
          dateCreated: DateTime.parse(e['dateCreated']),
          title: e['title'],
          todoId: e['_id'],
          dateDue: e['dateDue'],
          desc: e['description'],
        );
      }).toList();

      return todos;
    } else {
      return [];
    }
  }
}
