import 'package:basic_api/presentation/view/dog_breed_listview_screen.dart';
import 'package:basic_api/presentation/view/poke_listview_screen.dart';
import 'package:basic_api/presentation/viewmodel/poke_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasource/poke_remote_datasource.dart';
import 'data/repository/poke_repo_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokeRemoteDatasource = PokeRemoteDatasource();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokeListViewmodel(pokeRepository: PokeRepositoryImpls(remoteDatasource: pokeRemoteDatasource)),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DogBreedsListViewScreen(),
      ),
    );
  }
}
