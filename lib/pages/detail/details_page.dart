// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:rick_morty_characters_sample_app/models/character.dart';
import 'package:rick_morty_characters_sample_app/utils/common/navigation.dart';

class CharacterDetailsPage extends StatelessWidget {
  static String routeName = 'details_screen';
  final Character? character;

  CharacterDetailsPage({super.key, this.character});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigation.back(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'images/backbutton.png',
                              fit: BoxFit.fill,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Set width to screen width
                  child: Image.network(
                    character?.image ?? "",
                    fit: BoxFit.fitWidth, // Ensure the image fits the width
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                character?.name ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                character?.status ?? "",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                character?.species ?? "",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              // Add more character details as needed
            ],
          ),
        ),
      ),
    );
  }
}
