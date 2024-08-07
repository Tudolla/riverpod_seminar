import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_future_provider_model.dart';

// this is good way to create instance of userRepository, reduce out of memory.
final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() {
    const url = "https://jsonplaceholder.typicode.com/users/1";

    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }

  Future<User> fetchDetailUserData(String input) {
    var url = "https://jsonplaceholder.typicode.com/users/$input";

    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
