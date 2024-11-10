import 'package:basic_api/data/model/pokemon/pokemon.dart';
import 'package:equatable/equatable.dart';

class PokeListResponse extends Equatable {
  List<Pokemon>? pokeMons;
  PokeListResponse({this.pokeMons});

  factory PokeListResponse.fromJson(Map<String, dynamic> json) {
    final pokelist = <Pokemon>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        pokelist.add(Pokemon.fromJson(v));
      });
    }
    return PokeListResponse(
        pokeMons: pokelist
    );
  }

  @override
  List<Object?> get props => [pokeMons];
}