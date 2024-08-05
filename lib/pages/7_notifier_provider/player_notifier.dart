import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  final List<Map<String, dynamic>> allPlayer = [
    {"name": "Karim Benzema", "country": "France"},
    {"name": "Pold Pobba", "country": "France"},
    {"name": "Cristiano Ronanldo", "country": "Portugo"},
    {"name": "Hakimic", "country": "Spanish"},
    {"name": "Rooney", "country": "England"},
    {"name": "Harry Kane", "country": "England"},
    {"name": "Eng Halland", "country": "Switzden"},
    {"name": "Ibrahamunic", "country": "Italy"},
    {"name": "Pep Si", "country": "USA"},
    {"name": "Zidance", "country": "France"},
  ];
  @override
  build() {
    return allPlayer;
  }

  void filterPlayersByName(String name) {
    if (name.isEmpty) {
      state = allPlayer;
    } else {
      state = allPlayer.where((player) {
        final playerName = player['name'] as String;
        return playerName.toLowerCase().contains(name.toLowerCase());
      }).toList();
    }
  }
}
