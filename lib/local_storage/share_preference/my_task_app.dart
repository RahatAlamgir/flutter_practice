import 'package:flutter/material.dart';
import 'package:flutter_practice/local_storage/share_preference/task_home_screen.dart';
import 'package:flutter_practice/local_storage/share_preference/task_probider.dart';
import 'package:provider/provider.dart';

class MyTaskApp extends StatelessWidget {
  const MyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider()..loadTasks(),
      child: MaterialApp(
        title: "My task",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: TaskHomeScreen(),
      ),
    );
  }
}
