import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_future_provider_model.dart';
import 'package:riverpod_seminar/pages/4_future_provider/family_page.dart';

//ProviderRef
final fetchUserProvider = FutureProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(fetchUserProvider);
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber[200],
          title: const Text(
            "Future Provider",
            style: TextStyle(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.email,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FutureFamilyPage()));
                },
                child: const Text(
                  "More",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return SafeArea(
        child: Center(child: Text(error.toString())),
      );
    }, loading: () {
      return const SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
