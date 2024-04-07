import 'package:rick_and_morty_app_using_bloc/data/models/character.dart';
import 'package:rick_and_morty_app_using_bloc/data/web_sevices/characters_webservices.dart';

//class to map the data got from the api to the class model Character

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}





















// class CharactersRepository {
//   final CharactersWebServices charactersWebServices;

//   CharactersRepository({required this.charactersWebServices});

//   Future<List<Character>> getAllCharacters() async {
//     final charaters = await charactersWebServices.getAllCharacters();

//     return charaters.map((character) => Character.fromJson(character)).toList();
//   }
// }
