import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app_using_bloc/app_router.dart';
import 'package:rick_and_morty_app_using_bloc/business_logic/cubit/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app_using_bloc/data/repositories/characters_repository.dart';
import 'package:rick_and_morty_app_using_bloc/data/web_sevices/characters_webservices.dart';
import 'package:rick_and_morty_app_using_bloc/presentation/screens/character_screen.dart';

//get the data from api then pass it to repository then pass it to cubit

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersCubit(CharactersRepository(
              charactersWebServices: CharactersWebServices())),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: appRouter.generateRoute,
        home: CharactersScreen(),
      ),
    );
  }
}
