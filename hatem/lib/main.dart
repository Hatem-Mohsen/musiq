import 'package:flutter/material.dart';
import 'screens/getting_started_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DIEMU Music App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: GettingStartedScreen(),
    );
  }
}
