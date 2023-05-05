import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app_for_yandex/feature/data/datasources/character_remote_data_source.dart';

void main() async {
  runApp(MyApp());

  final characterRemoteDataSourceImpl = CharacterRemoteDataSourceImpl(client: http.Client());
  print(await characterRemoteDataSourceImpl.getAllCharacters());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
