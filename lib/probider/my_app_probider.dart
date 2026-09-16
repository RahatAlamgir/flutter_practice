import 'package:flutter/material.dart';
import 'package:flutter_practice/probider/count_home_screen.dart';
import 'package:flutter_practice/probider/model.dart';
import 'package:provider/provider.dart';

class MyAppProbider extends StatelessWidget {
  const MyAppProbider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'Probider Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: CountHomeScreen(),
      ),
    );
  }
}
