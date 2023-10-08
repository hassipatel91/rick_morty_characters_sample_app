part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class LoadingState extends CharacterState {
  List<Object?> get props => [];
}

class ErrorState extends CharacterState {
  final int? status;
  final String? message;

  ErrorState({this.status, this.message});

  List<Object> get props => [];
}

class CharacterLoaded extends CharacterState {
  final List<Character> characterResponse;
  CharacterLoaded({required this.characterResponse});

  List<Object?> get props => [characterResponse];
}
