import 'package:flutter/material.dart';
import 'package:flutter_practice/riverpod/home_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppRiverpodStart extends StatelessWidget {
  const MyAppRiverpodStart({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeRiverpod(),
      ),
    );
  }
}
