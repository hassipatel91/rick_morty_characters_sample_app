// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_morty_characters_sample_app/pages/home/home_page.dart';
import 'package:rick_morty_characters_sample_app/utils/common/navigation.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.run(() async {
      Navigation.intentWithClearAllRoutes(context, HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rick & Morty characters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.black, // Shadow color
                      offset: Offset(2, 2), // Shadow offset
                      blurRadius: 4, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
