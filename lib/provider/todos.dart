import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Groceries',
      description: '''-Eggs
      - Milk
      -Bread
      -Water''',
      id: '1',
      isDone: true,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk The dog !',
      description: '''-Go to the park
      - Go play ball with friends''',
      id: '1',
      isDone: false,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk The dog !',
      description: '''-Eggs
      - Milk
      -Bread
      -Water''',
      id: '1',
      isDone: false,
    )
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
