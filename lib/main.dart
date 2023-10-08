import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_characters_sample_app/bloc/home/character_bloc.dart';
import 'package:rick_morty_characters_sample_app/pages/detail/details_page.dart';
import 'package:rick_morty_characters_sample_app/pages/home/home_page.dart';
import 'package:rick_morty_characters_sample_app/pages/spalsh/splash_page.dart';
import 'injector_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty characters',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        CharacterDetailsPage.routeName: (context) => CharacterDetailsPage(),
        HomeScreen.routeName: (context) => BlocProvider<CharacterBloc>(
              create: (context) => di.getIt<CharacterBloc>(),
              child: const HomeScreen(),
            ),
      },
    );
  }
}
