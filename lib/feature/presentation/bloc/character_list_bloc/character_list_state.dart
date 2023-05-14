import 'package:equatable/equatable.dart';
import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';

abstract class GetAllCharacterState extends Equatable {
  const GetAllCharacterState();

  @override
  List<Object?> get props => [];
}

class GetAllCharactersEmpty extends GetAllCharacterState {}

class GetAllCharactersLoading extends GetAllCharacterState {}

class GetAllCharactersLoaded extends GetAllCharacterState {
  final List<CharacterEntity> characters;

  const GetAllCharactersLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class GetAllCharactersError extends GetAllCharacterState {
  final String message;

  const GetAllCharactersError({required this.message});

  @override
  List<Object?> get props => [message];
}