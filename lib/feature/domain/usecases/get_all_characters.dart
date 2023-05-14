import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_for_yandex/core/error/failure.dart';
import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';
import 'package:todo_app_for_yandex/feature/domain/repositories/character_repository.dart';
import 'package:todo_app_for_yandex/usecases/usecase.dart';

class GetAllCharacters extends UseCase<List<CharacterEntity>, GetAllCharactersParams> {
  final CharacterRepository characterRepository;

  GetAllCharacters(this.characterRepository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(GetAllCharactersParams params) async {
    return await characterRepository.getAllCharacters();
  }

}

class GetAllCharactersParams extends Equatable{
  @override
  List<Object?> get props => [];
}