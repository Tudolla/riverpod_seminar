// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Suggestion {
  final String activity;
  final String type;
  const Suggestion({
    required this.activity,
    required this.type,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      Suggestion(activity: json["activity"], type: json["type"]);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map) {
    return Suggestion(
      activity: map['activity'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Suggestion.fromJson(String source) =>
  //     Suggestion.fromMap(json.decode(source) as Map<String, dynamic>);
}
