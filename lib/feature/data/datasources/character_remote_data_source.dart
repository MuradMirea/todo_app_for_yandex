import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app_for_yandex/core/error/exception.dart';
import 'package:todo_app_for_yandex/feature/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters(int page);

  Future<List<CharacterModel>> searchCharacter(String query);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) => _getCharacterFromUrl(
      'https://hp-api.onrender.com/api/characters/?page=$page');

  @override
  Future<List<CharacterModel>> searchCharacter(String query) => _getCharacterFromUrl(
      'https://hp-api.onrender.com/api/characters/?name=$query');

  Future<List<CharacterModel>> _getCharacterFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final characters = json.decode(response.body);
      return (characters['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw ServerException();
    }
  }
}