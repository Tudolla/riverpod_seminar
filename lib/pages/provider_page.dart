import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/providers/provider.dart';

// final valueProvider = Provider<String>((ref) => "Hello Provider 2");

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNameProvider = ref.read(nameProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Provider",
          style: TextStyle(
            fontFamily: "fontApp",
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getNameProvider,
              style: const TextStyle(
                color: Colors.green,
                fontFamily: "fontApp",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // Method 2 ===================================================

      // body: Consumer(
      //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
      //     return Center(
      //       child: Text(
      //         "Return: ${ref.watch(nameProvider)}",
      //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
