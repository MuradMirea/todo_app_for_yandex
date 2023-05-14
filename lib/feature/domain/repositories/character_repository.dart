import 'package:dartz/dartz.dart';
import 'package:todo_app_for_yandex/core/error/failure.dart';
import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
}