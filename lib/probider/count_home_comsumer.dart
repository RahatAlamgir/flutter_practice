import 'package:flutter/material.dart';
import 'package:flutter_practice/probider/clock_screen.dart';
import 'package:flutter_practice/probider/count_display_screen.dart';
import 'package:flutter_practice/probider/model/clock_model.dart';
import 'package:flutter_practice/probider/model/model.dart';
import 'package:provider/provider.dart';

class CountHomeComsumer extends StatefulWidget {
  const CountHomeComsumer({super.key});

  @override
  State<CountHomeComsumer> createState() => _CounterHomeConnsumerState();
}

class _CounterHomeConnsumerState extends State<CountHomeComsumer> {
  int screenBuild = 0;
  int consumerBuild = 0;
  @override
  Widget build(BuildContext context) {
    screenBuild++;
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Counting"),
            Consumer<Counter>(
              builder: (context, counter, _) {
                consumerBuild++;
                return Row(
                  children: [
                    Text(
                      counter.count.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                    Text("screen: $screenBuild, consumer: $consumerBuild"),
                  ],
                );
              },
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
                  MaterialPageRoute(builder: (context) => CountHomeComsumer()),
                );
              },
              child: Text("ReBuild"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => ClockModel(),
                      child: ClockScreen(),
                    ),
                  ),
                );
              },
              child: Text("clock"),
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
