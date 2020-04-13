import 'package:flutter/material.dart';
import 'package:questions_screen/screens/main_screen.dart';
import 'package:questions_screen/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: MainScreen(),
    );
  }
}

