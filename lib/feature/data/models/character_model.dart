import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.house,
    required super.alive,
    required super.gender,
    required super.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      house: json['house'] as String,
      alive: json['alive'] as bool,
      gender: json['gender'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'house': house,
      'alive': alive,
      'gender': gender,
      'image': image,
    };
  }
}
