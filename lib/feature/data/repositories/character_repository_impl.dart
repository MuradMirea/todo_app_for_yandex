import 'package:dartz/dartz.dart';
import 'package:todo_app_for_yandex/core/error/failure.dart';
import 'package:todo_app_for_yandex/feature/data/datasources/character_remote_data_source.dart';
import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';
import 'package:todo_app_for_yandex/feature/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      return Right(await remoteDataSource.getAllCharacters());
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
