import 'dart:developer';

import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/data/datasource/poke_remote_datasource.dart';
import 'package:basic_api/data/model/poke_list_response.dart';
import 'package:basic_api/data/repository/poke_repo_impl.dart';
import 'package:basic_api/presentation/repository/poke_repository.dart';
import 'package:flutter/cupertino.dart';

class PokeListViewmodel extends ChangeNotifier {
    PokeListResponse? pokemonList;

    ApiState _pokeListApiState = ApiState.loading;
    ApiState get pokeListApiState => _pokeListApiState;
    setPokeListState(ApiState newState){
      _pokeListApiState = newState;
      notifyListeners();
    }

    getAllPokemons() async {
      final pokeRemoteDatasource = PokeRemoteDatasource();
      PokeRepository pokeRepo = PokeRepositoryImpls(remoteDatasource: pokeRemoteDatasource);
    //  setPokeListState(ApiState.loading);
      log("PokeList fetching..");
      final apiData = await pokeRepo.getAllPokemons();
      log("PokeList API Data : $apiData");
      if(apiData.apiResponseData != null){
        // Api Success
        log("PokeList fetched successfully!");
        setPokeListState(ApiState.success);
        pokemonList = PokeListResponse.fromJson(apiData.apiResponseData ?? {});
      }

      if(apiData.isErrorOccured()){
        // API Failure
        log("PokeList fetching failed!");
        setPokeListState(ApiState.failure);
      }
    }
}