import 'package:flutter/material.dart';
import 'package:flutter_practice/probider/count_display_screen.dart';
import 'package:flutter_practice/probider/model.dart';
import 'package:provider/provider.dart';

class CountHomeScreen extends StatefulWidget {
  const CountHomeScreen({super.key});

  @override
  State<CountHomeScreen> createState() => _CountHomeScreenState();
}

class _CountHomeScreenState extends State<CountHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Counting"),
            Text(
              context.watch<Counter>().count.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().decrement();
              },
              child: Text("decrement"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().reset();
              },
              child: Text("reset"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountDisplayScreen()),
                );
              },
              child: Text("Next Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CountHomeScreen()),
                );
              },
              child: Text("ReBuild"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
