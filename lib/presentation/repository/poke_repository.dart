import 'package:basic_api/core/api_data.dart';

abstract class PokeRepository {
  Future<ApiData> getAllPokemons();
  Future<ApiData> getAllDogBreeds();
}