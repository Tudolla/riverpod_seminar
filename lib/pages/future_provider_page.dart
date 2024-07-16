import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/suggestion.dart';
import 'package:riverpod_seminar/services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiService = ref.watch(suggestionApiProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
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
        child: suggestionRef.when(
            data: (data) {
              return Text(
                data.activity.toString(),
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: "fontApp",
                ),
              );
            },
            error: (error, _) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
