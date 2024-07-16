import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/suggestion.dart';

final suggestionApiProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      final res = await Dio().get('https://bored.api.lewagon.com/api/activity');
      return Suggestion.fromJson(res.data);
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
