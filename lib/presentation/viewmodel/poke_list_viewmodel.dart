import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/data/datasource/poke_remote_datasource.dart';
import 'package:basic_api/data/model/dog/dog_breed_response.dart';
import 'package:basic_api/data/model/pokemon/poke_list_response.dart';
import 'package:basic_api/data/repository/poke_repo_impl.dart';
import 'package:basic_api/presentation/repository/poke_repository.dart';
import 'package:flutter/cupertino.dart';

class PokeListViewmodel extends ChangeNotifier {
    PokeRepository pokeRepository;
    PokeListViewmodel({required this.pokeRepository});

    PokeListResponse? _pokemonList;
    PokeListResponse? get pokemonList => _pokemonList;

    DogBreedListResponse? _dogBreedList;
    DogBreedListResponse? get dogBreedList => _dogBreedList;

    ApiState _dogListApiState = ApiState.loading;
    ApiState get dogListApiState => _dogListApiState;
    setDogBreedListState(ApiState newState){
      _dogListApiState = newState;
      notifyListeners();
    }

    ApiState _pokeListApiState = ApiState.loading;
    ApiState get pokeListApiState => _pokeListApiState;
    setPokeListState(ApiState newState){
      _pokeListApiState = newState;
      notifyListeners();
    }



    getAllPokemons() async {
      final pokeRemoteDatasource = PokeRemoteDatasource();
      PokeRepository pokeRepo = PokeRepositoryImpls(remoteDatasource: pokeRemoteDatasource);
      final apiData = await pokeRepo.getAllPokemons();
      if(apiData.isErrorOccured()){
        // Handle API Failure
        setPokeListState(ApiState.failure);
        return;
      }
      if(apiData.apiResponseData != null){
        // Handle Api Success
        _pokemonList = PokeListResponse.fromJson(apiData.apiResponseData ?? {});
        setPokeListState(ApiState.success);
      }
    }

    getAllDogBreeds() async {
      final pokeRemoteDatasource = PokeRemoteDatasource();
      PokeRepository pokeRepo = PokeRepositoryImpls(remoteDatasource: pokeRemoteDatasource);
      final apiData = await pokeRepo.getAllDogBreeds();
      if(apiData.isErrorOccured()){
        // Handle API Failure
        setDogBreedListState(ApiState.failure);
        return;
      }
      if(apiData.apiResponseData != null){
        // Handle Api Success
        _dogBreedList = DogBreedListResponse.fromJson(apiData.apiResponseData ?? {});
        setDogBreedListState(ApiState.success);
      }
    }
}
