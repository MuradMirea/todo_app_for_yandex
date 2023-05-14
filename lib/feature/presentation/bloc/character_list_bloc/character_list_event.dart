import 'package:equatable/equatable.dart';

abstract class GetAllCharactersEvent extends Equatable {
  const GetAllCharactersEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllCharacters extends GetAllCharactersEvent {
  const GetAllCharacters();
}