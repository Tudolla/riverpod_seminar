import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<String>((ref) => "Sunday King");

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: Text(
          "The value is ${ref.watch(valueProvider)}",
          style: const TextStyle(
            fontFamily: "fontApp",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Method 2 ===================================================

      // body: Consumer(
      //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
      //     return Center(
      //       child: Text(
      //         "The value of provider is : ${ref.watch(valueProvider)}",
      //         style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
