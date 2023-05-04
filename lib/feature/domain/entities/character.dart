import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final String house;
  final bool alive;
  final String gender;
  final String image;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.house,
    required this.alive,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    house,
    alive,
    gender,
    image,
  ];
}
