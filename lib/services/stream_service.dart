import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamServiceProvider = Provider<StreamService>((ref) => StreamService());

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(milliseconds: 10), (i) => i)
        .take(10000);
  }
}
