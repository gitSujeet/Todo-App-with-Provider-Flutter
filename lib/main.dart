import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_provider/providers/task_provider.dart';
import 'package:todoapp_provider/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App with Provider',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
