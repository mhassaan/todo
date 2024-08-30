import 'package:flutter/material.dart';
import 'package:test_drive/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "My todo app";
  @override
  // List taskList = [
  //   ["Ready to go", false]
  //   ["Revision", false]
  // ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
