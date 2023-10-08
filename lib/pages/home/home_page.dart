// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_characters_sample_app/models/character.dart';
import 'package:rick_morty_characters_sample_app/pages/detail/details_page.dart';
import 'package:rick_morty_characters_sample_app/pages/home/widget/card_widget.dart';
import '../../bloc/home/character_bloc.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Character> characters = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false; // Flag to track whether new data is being loaded

  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(GetCharacterEvent(page: 1));
    // Add a listener to the scroll controller
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!isLoading &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading =
            true; // Set loading flag to true when new data is being loaded
      });
      BlocProvider.of<CharacterBloc>(context).add(LoadMoreCharacterEvent());
    }
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
        child: BlocConsumer<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is CharacterLoaded) {
              setState(() {
                characters.addAll(state.characterResponse);
                isLoading =
                    false; // Set loading flag to false when new data is loaded
              });
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Rick & Morty characters',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Add your filter button tap action here
                            },
                            child: const Icon(
                              Icons.filter_list, // Use the filter icon here
                              size: 30,
                              color: Colors.black, // Set the icon color
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: characters.length +
                            (isLoading ? 1 : 0), // Add 1 for loading indicator
                        itemBuilder: (BuildContext context, int index) {
                          if (index < characters.length) {
                            var item = characters[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharacterDetailsPage(
                                      character: item,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CharacterCard(character: item),
                              ),
                            );
                          } else {
                            // Display a loading indicator
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
