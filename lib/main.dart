import 'package:flutter/material.dart';
import 'provider/todos.dart';
import 'page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Task Manager';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            canvasColor: Color(0xFFF3F3F3),
            primaryColor: Color(0xFF5AC081),
          ),
          home: HomePage(),
        ),
      );
}
