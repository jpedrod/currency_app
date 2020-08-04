import 'package:flutter/material.dart';
import 'app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue[600],
          scaffoldBackgroundColor: Colors.white),
      home: Home(),
    );
  }
}
