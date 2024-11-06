import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/data/model/poke_list_response.dart';

abstract class PokeRepository {
  Future<ApiData> getAllPokemons();
}