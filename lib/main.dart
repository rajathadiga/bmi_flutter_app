import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Health Advisor',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: InputScreen(),
  ));
}
