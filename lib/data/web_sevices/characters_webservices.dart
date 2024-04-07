import 'package:dio/dio.dart';
import 'package:rick_and_morty_app_using_bloc/constants/strings.dart';

// class to get the data from the api
class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");

      return response.data["results"];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
