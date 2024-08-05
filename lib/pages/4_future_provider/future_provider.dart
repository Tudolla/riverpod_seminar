import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_future_provider_model.dart';

final fetchUserProvider = FutureProvider((ref) {
  const url = "https://jsonplaceholder.typicode.com/users/1";

  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
});
