import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/services/stream_service.dart';

final streamValueProvider = StreamProvider((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueStream = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: valueStream.when(data: (int data) {
          return Text(
            data.toString(),
          );
        }, error: (error, stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
