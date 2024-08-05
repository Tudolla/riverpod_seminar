import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/7_notifier_provider/player_notifier.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerNotifierProvider) as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier Provider"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => ref
                  .read(playerNotifierProvider.notifier)
                  .filterPlayersByName(value),
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(.3),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.flag,
                      color: index % 3 == 0
                          ? Colors.red
                          : index % 2 == 0
                              ? Colors.blue
                              : Colors.yellow,
                    ),
                    title: Text(
                      players[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      players[index]['country'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
