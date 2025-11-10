import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/counter_provider.dart';

void main() {
  runApp(
    // ProviderScope is required for Riverpod to work
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the counter provider
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Rebuild Slice 🌀"),
      ),
      body: Center(
        child: Text(
          "Count: $count",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
