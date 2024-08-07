import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_change_notifier_provider_model.dart';

final userChangeNotifierProvider =
    ChangeNotifierProvider<UserChangeNotifier>((ref) => UserChangeNotifier());

class UserChangeNotifier extends ChangeNotifier {
  User user = const User(name: '', age: 10);

  void updateNameChange(String n) {
    user = user.copyWith(name: n);

    notifyListeners();
  }

  void updateAgeChange(int a) {
    user = user.copyWith(age: a);

    notifyListeners();
  }

  void updateAll(String n, int a) {
    user = User(name: n, age: a);
    // user = user.copyWith(name: n, age: a);

    notifyListeners();
  }
}
