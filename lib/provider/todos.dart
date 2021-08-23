import 'package:flutter/cupertino.dart';
import 'package:todo2/model/todo.dart';

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
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
