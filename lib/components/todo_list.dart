// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskState;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? onDelete;
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskState,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
            label: "Delete",
            icon: Icons.delete,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.purple),
          child: Row(
            children: [
              Checkbox(value: taskState, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskState
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
