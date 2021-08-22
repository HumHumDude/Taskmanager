import 'package:flutter/material.dart';
import 'package:todoapp/provider/todos.dart';
import 'provider/todos.dart';
import 'page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primaryColor: Color(0xFF5AD880),
          ),
          home: HomePage(),
        ),
      );
}
