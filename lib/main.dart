import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app_for_yandex/feature/data/datasources/character_remote_data_source.dart';
import 'package:todo_app_for_yandex/feature/domain/entities/character.dart';

void main() async {
  final characterRemoteDataSourceImpl =
  CharacterRemoteDataSourceImpl(client: http.Client());
  List<CharacterEntity> characterList =
  await characterRemoteDataSourceImpl.getAllCharacters();

  runApp(MyApp(
    characterList: characterList,
  ));
}

class MyApp extends StatelessWidget {
  final List<CharacterEntity> characterList;

  const MyApp({Key? key, required this.characterList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 243, 226),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 122, 43, 43),
          title: const Text(
            "Harry Potter API",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 7)),
                  CardRow(character: characterList[index])
                ]);
              } else if (index == characterList.length - 1) {
                return Column(children: [
                  CardRow(character: characterList[index]),
                  const Padding(padding: EdgeInsets.only(bottom: 7))
                ]);
              } else {
                return CardRow(character: characterList[index]);
              }
            },
            separatorBuilder: (context, index) {
              return Container();
            },
            itemCount: characterList.length),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  final CharacterEntity character;

  const CardRow({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 14.0, right: 14.0, top: 7, bottom: 7.0),
      child: Card(
        color: const Color.fromARGB(255, 230, 217, 198),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        elevation: 4,
        shadowColor: const Color.fromARGB(64, 0, 0, 0),
        child: Row(
          children: [
            Container(
              height: 200,
              width: 135,
              child: Image.network(
                character.image,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
              ),
            ),
            Text(character.name),
            if (character.gender == 'male')
              const Icon(
                Icons.male,
                color: Color.fromARGB(255, 0, 178, 255),
              )
            else
              if (character.gender == 'female')
                const Icon(
                  Icons.female,
                  color: Color.fromARGB(255, 255, 0, 138),
                ),
            Text(character.house),
            if (character.alive == 'true')
              const Text('alive')
            else if (character.alive == 'false')
              const Text('dead')
          ],
        ),
      ),
    );
  }
}
