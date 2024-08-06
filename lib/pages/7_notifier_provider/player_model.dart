// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlayerModel {
  final String name;
  final String country;

  PlayerModel({
    required this.name,
    required this.country,
  });

  PlayerModel copyWith({
    String? name,
    String? country,
  }) {
    return PlayerModel(
      name: name ?? this.name,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      name: map['name'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) =>
      PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PlayerModel(name: $name, country: $country)';

  @override
  bool operator ==(covariant PlayerModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.country == country;
  }

  @override
  int get hashCode => name.hashCode ^ country.hashCode;
}
