import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/core/api_handler.dart';

class PokeRemoteDatasource {
  final apiHandler = ApiHandler();
  Future<ApiData> getPokeListData() async {
    return await apiHandler.get("https://pokeapi.co/api/v2/pokemon/?limit=25");
  }
}