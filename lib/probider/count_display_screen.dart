import 'package:flutter/material.dart';
import 'package:flutter_practice/probider/model/model.dart';
import 'package:provider/provider.dart';

class CountDisplayScreen extends StatelessWidget {
  const CountDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              context.watch<Counter>().count.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
