import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/1_provider/provider.dart';

// final valueProvider = Provider<String>((ref) => "Hello Provider 2");

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNameProvider = ref.read(nameProvider);
    final footballer = ref.read(footballerProvider);

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
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.green,
            fontFamily: "fontApp",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getNameProvider,
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                "* ${footballer.name}",
              ),
              Text(
                "* ${footballer.age}",
              ),
              Text(
                "* ${footballer.fcClub}",
              ),
            ],
          ),
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
