import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateProvider((Ref ref) {
  return 0;
});

class CounterRiverPod extends ConsumerWidget {
  const CounterRiverPod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final counter = ref.watch(counterProvider);
            return Text(counter.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
