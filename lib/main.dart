import 'package:flutter/material.dart';
import 'package:whatsapp_clone/ui/MainScreen.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
    theme: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black45,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
