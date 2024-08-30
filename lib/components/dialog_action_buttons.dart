import "package:flutter/material.dart";

class DialogActionButtons extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const DialogActionButtons(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
