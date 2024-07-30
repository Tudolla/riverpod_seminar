import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_change_notifier_provider_model.dart';

final userChangeNotifierProvider =
    ChangeNotifierProvider<UserChangeNotifier>((ref) => UserChangeNotifier());
