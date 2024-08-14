import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    // root base for all provider in Riverpod
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (provider is StateNotifierProvider) {
      print('Listening changes: $provider $previousValue $newValue $container');
    }
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (provider is StateNotifierProvider) {
      print('MY_OBSERVER: ${provider.runtimeType} được thêm vào');
      print('MY_OBSERVER: giá trị ban đầu $value');
    }
  }

  // @override
  // void didDisposeProvider(
  //   ProviderBase provider,
  //   ProviderContainer container,
  // ) {
  //   if (provider is StateNotifierProvider) {
  //     print('MY_OBSERVER: ${provider.runtimeType} đã bị hủy');
  //   }
  // }
}
