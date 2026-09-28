import 'package:flutter/material.dart';
import 'package:flutter_practice/riverpod/slider/slider_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

class MyAppSlider extends StatelessWidget {
  const MyAppSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: MaterialApp(home: SliderTestRiverpod()));
  }
}

class SliderTestRiverpod extends ConsumerWidget {
  const SliderTestRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider with Riverpod")),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, _) {
                double value = ref.watch(
                  sliderProvider.select((state) => state.value),
                );
                print("value $value");
                return Container(
                  color: Colors.red.withValues(alpha: value),
                  height: 100,
                  width: 100,
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final slidervalue = ref.watch(
                  sliderProvider.select((state) => state.isDone),
                );
                print("is Done");
                return Container(
                  color: slidervalue ? Colors.red : Colors.white,
                  height: 100,
                  width: 100,
                  child: Switch(
                    value: slidervalue,
                    onChanged: (value) {
                      final sliderisDoneUpadter = ref.read(
                        sliderProvider.notifier,
                      );

                      sliderisDoneUpadter.state = sliderisDoneUpadter.state
                          .copyWith(isDone: !slidervalue);
                    },
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                final sliderValue = ref.watch(sliderProvider);
                return Slider(
                  value: sliderValue.value,
                  onChanged: (value) {
                    ref.read(sliderProvider.notifier).state = ref
                        .read(sliderProvider.notifier)
                        .state
                        .copyWith(value: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
