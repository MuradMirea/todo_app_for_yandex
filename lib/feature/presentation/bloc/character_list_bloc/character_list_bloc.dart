import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_app_for_yandex/core/error/failure.dart';
import 'package:todo_app_for_yandex/feature/domain/usecases/get_all_characters.dart';
import 'package:todo_app_for_yandex/feature/presentation/bloc/character_list_bloc/character_list_event.dart';
import 'package:todo_app_for_yandex/feature/presentation/bloc/character_list_bloc/character_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

// class GetAllCharactersBloc extends Bloc<GetAllCharactersEvent, GetAllCharacterState> {
//   final GetAllCharacters getAllCharacter;
//
//   GetAllCharactersBloc({required this.getAllCharacter}) : super(GetAllCharactersEmpty()) {
//     on<GetAllCharacters>(_onEvent);
//   }
//
//   FutureOr<void> _onEvent(
//       GetAllCharacters event, Emmiter<GetAllCharactersState> emit) async {
//     emit(GetAllCharactersLoading());
//     final failureOrPerson =
//         await getAllCharacters(GetAllCharactersParams());
//     emit(failureOrPerson.fold(
//         (failure) => GetAllCharactersError(message: _mapFailureToMessage(failure)),
//         (character) => GetAllCharactersLoaded(characters: character)));
//   }
//
//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return SERVER_FAILURE_MESSAGE;
//       default:
//         return 'Unexpected Error';
//     }
//   }
// }