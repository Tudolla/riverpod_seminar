import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:riverpod_seminar/home_screen.dart';
import 'package:riverpod_seminar/logger_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        LoggerRiverpod(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Seminar',
      theme: FlexThemeData.light(scheme: FlexScheme.bigStone),
      themeMode: ThemeMode.system,
      home: const Lamborghini(),
    );
  }
}
