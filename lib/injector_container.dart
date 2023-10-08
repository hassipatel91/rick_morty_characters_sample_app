import 'package:get_it/get_it.dart';
import 'package:rick_morty_characters_sample_app/bloc/home/character_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => CharacterBloc());
}
