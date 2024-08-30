// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:test_drive/components/dialog_action_buttons.dart";

class DialogBox extends StatelessWidget {
  final controller;
  final void Function()? onSave;
  final void Function()? onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new task"),
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Add new task'),
            ),
            Row(
              children: [
                DialogActionButtons(buttonText: "Save", onPressed: onSave),
                DialogActionButtons(buttonText: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
