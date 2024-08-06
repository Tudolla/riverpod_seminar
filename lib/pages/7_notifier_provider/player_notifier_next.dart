import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_seminar/pages/7_notifier_provider/player_model.dart';

part 'player_notifier_next.g.dart';

@riverpod
class PlayerModelListNotifier extends _$PlayerModelListNotifier {
  @override
  List<PlayerModel> build() {
    return [
      PlayerModel(name: 'Alice', country: 'USA'),
      PlayerModel(name: 'Bob', country: 'Canada'),
      PlayerModel(name: 'Charlie', country: 'UK'),
    ];
  }

  void addPlayerModel(PlayerModel newPlayerModel) {
    state = [...state, newPlayerModel];
  }

  void removePlayerModel(PlayerModel playerModel) {
    state = state.where((u) => u.name != playerModel.name).toList();
  }

  void updatePlayerModel(PlayerModel updatedPlayerModel) {
    state = state
        .map((PlayerModel) => PlayerModel.name == updatedPlayerModel.name
            ? updatedPlayerModel
            : PlayerModel)
        .toList();
  }

  List<PlayerModel> filterPlayerModelByName(String query) {
    return state
        .where((PlayerModel) =>
            PlayerModel.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
