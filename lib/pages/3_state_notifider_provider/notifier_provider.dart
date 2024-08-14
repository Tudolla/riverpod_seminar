import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier_provider.g.dart';

class FootballClub {
  final String name;
  final int price;

  FootballClub({
    required this.name,
    required this.price,
  });
}

@riverpod
class FCNotifier extends _$FCNotifier {
  @override
  FootballClub build() {
    return FootballClub(
      name: "Manchester City",
      price: 1000000,
    );
  }

  // this is so dreaming . state = newName => this seem be like mutable , but no
  // it still create a copy of state => so it immutable
  void updateFC(String newName, int newPrice) {
    state = FootballClub(name: newName, price: newPrice);
  }
}
