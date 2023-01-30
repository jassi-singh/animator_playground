import 'package:animator_playground/constants/my_theme.dart';
import 'package:animator_playground/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animator Playground',
      theme: ThemeData(
        primarySwatch: MyTheme.myTheme,
      ),
      home: const HomePage(),
    );
  }
}
