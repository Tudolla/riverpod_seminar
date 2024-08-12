import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider return String
final nameProvider = Provider<String>((ref) => "Hello Provider");

// provider return Object
final footballerProvider = Provider<Footballer>(
  (ref) => Footballer(
    name: "Tiến Linh",
    age: 18,
    fcClub: "HAGL",
  ),
);

class Footballer {
  final String name;
  final int age;
  final String fcClub;

  Footballer({
    required this.name,
    required this.age,
    required this.fcClub,
  });
}
