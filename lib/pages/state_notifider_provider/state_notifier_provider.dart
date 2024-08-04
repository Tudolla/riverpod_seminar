import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_state_notifier_provider_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(
      name: "...",
      age: 16,
    ),
  ),
);
