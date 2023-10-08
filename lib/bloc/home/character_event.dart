part of 'character_bloc.dart';

abstract class CharacterEvent {}

class GetCharacterEvent extends CharacterEvent {
  final int page;
  GetCharacterEvent({required this.page});
}

class LoadMoreCharacterEvent extends CharacterEvent {
  LoadMoreCharacterEvent();
}
