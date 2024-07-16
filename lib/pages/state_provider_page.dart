import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// .autoDispose()
final valueStateProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (pre, curr) {
      if (curr == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Value is 10")));
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        centerTitle: true,
        title: const Text(
          "State Provider",
          style: TextStyle(
            fontFamily: "fontApp",
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              // "The present number: ${ref.read(valueStateProvider)}",

              "The present number: $result",

              style: const TextStyle(
                fontSize: 25,
                fontFamily: "fontApp",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(valueStateProvider.notifier).state++;
              },
              child: const Text(
                "+",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(valueStateProvider);
              },
              child: const Text(
                "⨀",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
