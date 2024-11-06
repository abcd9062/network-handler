import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  String? name;
  Pokemon({this.name = "No Response"});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
        name: json['name']
    );
  }

  @override
  List<Object?> get props => [name];
}