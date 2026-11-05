import 'package:flutter/material.dart';
import 'package:flutter_practice/riverpod/counter/counter_riverpod.dart';
import 'package:flutter_practice/riverpod/search/search_riverpod.dart';
import 'package:flutter_practice/riverpod/slider/slider_test_riverpod.dart';

class HomeRiverpod extends StatelessWidget {
  const HomeRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deshboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterRiverPod()),
                );
              },
              child: Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SliderTestRiverpod()),
                );
              },
              child: Text("Slider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchRiverpod()),
                );
              },
              child: Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
