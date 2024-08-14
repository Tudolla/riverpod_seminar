import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/2_state_provider/state_provider.dart';

// .autoDispose
final valueStateProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  // void _clickToIncrement(WidgetRef ref){
  //   ref.read(valueStateProvider.notifier).state++;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(valueStateProvider);

    final companyName = ref.watch(companyProvider) ?? '';

    ref.listen<int>(valueStateProvider, (pre, curr) {
      if (curr == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("10 điểm")));
      }
    });
    //

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Number: $result",
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: "fontApp",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(valueStateProvider.notifier).state++;
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // future, stream
                    ref.invalidate(valueStateProvider);
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 40,
            ),

            // -----------------------------------------------------------
            Container(
              margin: const EdgeInsets.all(15),
              child: TextField(
                onSubmitted: (value) {
                  ref.watch(companyProvider.notifier).update((state) => value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter name company",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                "Update name : ${companyName}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
