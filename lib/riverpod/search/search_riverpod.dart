import 'package:flutter/material.dart';
import 'package:flutter_practice/riverpod/search/search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRiverpod extends ConsumerWidget {
  const SearchRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Priverpod")),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                return Text(
                  ref.watch(searchProvider.select((state) => state.search)),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) {
                bool onChanged = ref.watch(
                  searchProvider.select((state) => state.isChanged),
                );

                return Switch(
                  value: onChanged,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).onChange(value);
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
