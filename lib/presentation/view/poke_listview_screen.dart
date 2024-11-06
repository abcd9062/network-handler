import 'dart:developer';

import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/presentation/viewmodel/poke_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokeListviewScreen extends StatefulWidget {
  const PokeListviewScreen({super.key});

  @override
  State<PokeListviewScreen> createState() => _PokeListviewScreenState();
}

class _PokeListviewScreenState extends State<PokeListviewScreen> {
  PokeListViewmodel? viewModel;
  @override
  void initState() {
    viewModel = Provider.of<PokeListViewmodel>(context, listen: false);
    viewModel?.getAllPokemons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PokeListViewmodel>(
          builder: (context, vm, child) {
            log("PokeList Length : ${vm.pokemonList?.pokeMons?.length}");
            return Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Visibility(
                      visible: vm.pokeListApiState == ApiState.loading,
                      child: const CircularProgressIndicator()),
                ),
                Visibility(
                  visible: vm.pokeListApiState == ApiState.success,
                  child: ListView.builder(
                      key: Key("listView"),
                      itemCount: vm.pokemonList?.pokeMons?.length,
                      itemBuilder: (context, pos) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: ListTile(
                              key: Key("listItem${pos+1}"),
                              tileColor: Colors.blueGrey,
                              title: Text(vm.pokemonList?.pokeMons?[pos].name ?? "No Name",
                                style: const TextStyle(fontSize: 24),
                              ),
                            ));
                      }),
                ),
              ],
            );
          }
      ),
    );
  }
}
