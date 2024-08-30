import "package:flutter/material.dart";
import "package:test_drive/components/dialog_box.dart";
import "package:test_drive/components/todo_list.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key, title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List taskList = [
    ["Start the engine", false],
    ["Hit the gear", false]
  ];

  void checkBoxChanged(bool? value, task) {
    setState(() {
      task[1] = !task[1];
    });
  }

  void onSave() {
    setState(() {
      taskList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: onSave,
            onCancel: onCancel,
          );
        });
  }

  void onDelete(task) {
    setState(() {
      taskList.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: <TodoList>[
          for (final task in taskList) ...[
            TodoList(
              taskName: task[0],
              taskState: task[1],
              onChanged: (value) => checkBoxChanged(value, task),
              onDelete: (context) => onDelete(task),
            )
          ]
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: openDialog),
    );
  }
}
