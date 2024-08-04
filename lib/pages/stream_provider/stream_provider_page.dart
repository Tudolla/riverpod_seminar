import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/stream_provider/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

String formatTime(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

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
          return Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(.5),
              ),
            ),
            child: Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
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
