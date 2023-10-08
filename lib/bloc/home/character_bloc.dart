import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_characters_sample_app/models/character.dart';
import '../../networking/rest_client.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final client = RestClient(Dio(BaseOptions(contentType: 'application/json')));
  late List<Character> characters = [];
  int currentPage = 1;

  CharacterBloc() : super(CharacterInitial());

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is GetCharacterEvent || event is LoadMoreCharacterEvent) {
      try {
        if (event is LoadMoreCharacterEvent) {
          currentPage++;
        }

        yield LoadingState();
        var responseData = await client.getCharacter(currentPage);
        final newCharacters = responseData.charactors;

        // Append the new characters to the existing list
        characters.addAll(newCharacters);

        yield CharacterLoaded(characterResponse: characters);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
