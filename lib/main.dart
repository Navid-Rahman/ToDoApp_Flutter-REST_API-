import 'package:flutter/material.dart';
import 'package:todo_restapi_flutter/screens/home_page.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myAppTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
