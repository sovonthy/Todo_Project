import 'package:flutter/material.dart';
import 'todo.dart';

class TodoListCheck extends StatefulWidget {
  @override
  _TodoListCheckState createState() => _TodoListCheckState();
}

class _TodoListCheckState extends State<TodoListCheck> {
  List<Todo> todos = [];
  TextEditingController controller = new TextEditingController();
    _checkTodo(Todo todo, bool isChecked) {
        setState(() {
      todo.isSuccess = isChecked;
    });
   }
   
    Widget _buildItem(BuildContext context, int item) {
     final todo = todos[item];
//return list of value input and check list
    return CheckboxListTile(
      value: todo.isSuccess,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
      _checkTodo(todo, isChecked);
      },
     );
   }
//show alert input the value
_addListTodo() async {
final todo = await showDialog<Todo>(
       context: context,
       builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
           title: Text('New todo'),
           content: TextField(
           controller: controller,
           autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel", style: TextStyle(color: Colors.blue),),
               onPressed: () {
               Navigator.of(context).pop(); 
              },    
            ),
            FlatButton(
              child: Text("Add", style: TextStyle(color: Colors.blue),),
              onPressed: () {
              setState(() {
              final todo = new Todo(title: controller.value.text);
              if(controller.value.text == ""){
              print("");
              }else{
              todos.add(todo); 
              }
                  controller.clear();
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );    
       },
     );
      if(todo != null) {
       setState(() {
         todos.add(todo);
       });
     }
   } 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: _addListTodo,
       ),
    );
  }
}
