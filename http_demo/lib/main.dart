import 'dart:convert';//json verileri ile çalışmak için gerekli

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/todo.dart';
import 'apis/api.dart';

void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }

}

class TodoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>TodoListState();
}

class TodoListState extends State{
  List<Todo> list = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Data Todo List"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,position){
          return ListTile(
            title: Text(list[position].title),
          );
        },
      ),
    );
  }

  getTodos(){
    Api.getTodos().then((response){
      setState(() {
        //Iterable gezilebilir döngüye tabi tutulabilir demektir
       Iterable api_body = json.decode(response.body); 
       // her bir model için map işlemi yapar
       this.list = api_body.map((model)=>Todo.fromJson(model)).toList();
      });
    });
  }
  @override
  void initState() {
    // sayfa load event'i
    super.initState();
    getTodos();
  }
}