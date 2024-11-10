import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/data/datasource/poke_remote_datasource.dart';
import 'package:basic_api/presentation/repository/poke_repository.dart';

class PokeRepositoryImpls extends PokeRepository {
  final PokeRemoteDatasource remoteDatasource;
  PokeRepositoryImpls({required this.remoteDatasource});

  @override
  Future<ApiData> getAllPokemons() async {
     return await remoteDatasource.getPokeListData();
  }

  @override
  Future<ApiData> getAllDogBreeds() async {
    return await remoteDatasource.getAllDogBreeds();
  }

}