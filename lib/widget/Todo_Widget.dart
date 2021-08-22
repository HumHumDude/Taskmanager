import '../model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            key: Key(todo.id),
            actions: [
              IconSlideAction(
                color: Colors.green,
                caption: "Edit",
                icon: Icons.edit,
                onTap: () {},
              )
            ],
            secondaryActions: [
              IconSlideAction(
                color: Colors.red,
                caption: 'Delete',
                onTap: () {},
              )
            ],
            child: builTodo(context)),
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
                onChanged: (_) {}),
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
}
