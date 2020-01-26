
import 'package:flutter/material.dart';
import 'package:todo_list/todolist.dart';
void main() => runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListCheck(),
    );
  }
}