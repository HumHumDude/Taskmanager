import 'package:todo2/provider/todos.dart';
import 'package:provider/provider.dart';
import '../model/todo.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_slidable/flutter_slidable.dart';
import '../page/edit_todo.dart';
import '../utils.dart';
import '../provider/todos.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                key: Key(todo.id),
                actions: [
                  IconSlideAction(
                    color: Colors.green,
                    onTap: () => editTodo(context, todo),
                    caption: 'Edit',
                    icon: Icons.edit,
                  )
                ],
                secondaryActions: [
                  IconSlideAction(
                    color: Colors.red,
                    caption: 'Delete',
                    onTap: () => deleteTodo(context, todo),
                    icon: Icons.delete,
                  )
                ],
                child: builTodo(context)),
          ),
        ),
      );
  Widget builTodo(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
                  Utils.showSnackBar(context,
                      isDone ? 'Task Completed' : 'Task marked incomplete');
                }),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  )
              ],
            ))
          ],
        ),
      );
  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');
  }

  editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),
    ));
  }
}
