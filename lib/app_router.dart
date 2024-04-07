import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app_using_bloc/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app_using_bloc/constants/strings.dart';
import 'package:rick_and_morty_app_using_bloc/data/repositories/characters_repository.dart';
import 'package:rick_and_morty_app_using_bloc/data/web_sevices/characters_webservices.dart';
import 'package:rick_and_morty_app_using_bloc/presentation/screens/character_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charaterDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => charactersCubit,
                child: const CharactersScreen()));
    }
  }
}
