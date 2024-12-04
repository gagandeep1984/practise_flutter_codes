import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../layouts/todo_list_tile.dart';

class TodoList extends StatefulWidget {
  // TodoList({ key?: key }): super(key: key);
  TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListScreen();
}

class _TodoListScreen extends State<TodoList> {
  final _controller = TextEditingController();

  final List todoList = [
    ['Code With Otabek', true],
    ['Learn Flutter', true],
    ['Drink Coffee', false],
    ['Explore Firebase', false],
  ];

  void saveTask() {
    setState(() => todoList.add(_controller.value.text));
  }

  void deleteTask(int index) {
    print("${todoList[index][0]} to be deleted..");
    setState(() {
      todoList.removeAt(index);
    });
  }

  void toggleTask(int index) {
    print("${todoList[index][0]} to be toggled..");
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(label: "Dismiss", onPressed: () {}),
    ));
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("Simple Todo"),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(buildContext).showSnackBar(SnackBar(
              content: const Text("Application Settings"),
              action: SnackBarAction(label: "Dismiss", onPressed: () {}),
            )),
          ),
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: () => print("Home clicked")
              //     Fluttertoast.showToast( msg: "Home Selected", ),
              ),
        ],
      ),
      body:
      // Column(children: [
        ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, index) {
              // final String taskName = todoList[index][0];
              // final bool taskCompleted = todoList[index][1];
              // onDelete(index) => deleteTask(index);
              // final Function(bool?)? onToggle(context) => toggleTask(index);

              // return Text(todoList[index][0]);
              return TodoListTile(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => toggleTask(index),
                onDelete: (context) => deleteTask(index),
              );
            }),
        // Row(
        //   children: [
        //     TextField(
        //       controller: _controller,
        //     ),
        //     ElevatedButton(
        //         child: Icon(Icons.add),
        //         onPressed: () {
        //           if (_controller.value.text.isEmpty) {
        //             showSnackBarMessage(context, "Please add some text");
        //             return;
        //           }
        //           setState(() => todoList.add(_controller.value.text));
        //         }),
        //   ],
        // ),
       // ]),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => setState(() {
      //     if (_controller.value.text.isEmpty) {
      //       showSnackBarMessage(context, "Please add some text");
      //       return;
      //     }
      //
      //     todoList.add(_controller.value.text);
      //   }),
      // ),

      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 0),
      //   child: Row(
      //     children: [
      //       TextField(
      //         controller: _controller,
      //       ),
      //       FloatingActionButton(
      //         onPressed: () => saveTask,
      //         child: const Icon(Icons.add),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
