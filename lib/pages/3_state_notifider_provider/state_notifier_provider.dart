import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_state_notifier_provider_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(
      name: "...",
      age: 0,
    ),
  ),
);

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  // when all the state update => then the Client is listening the changes
  void updateName(String newName) {
    state = User(name: newName, age: state.age);
    // state = state.copyWith(name: newName);
  }

  void updateAge(int newAge) {
    state = state.copyWith(age: newAge);
  }

  void updateNameAndAge(String newName, int newAge) {
    state = state.copyWith(name: newName, age: newAge);
  }
}
