import 'package:basic_api/core/api_data.dart';
import 'package:basic_api/presentation/viewmodel/poke_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogBreedsListViewScreen extends StatefulWidget {
  const DogBreedsListViewScreen({super.key});

  @override
  State<DogBreedsListViewScreen> createState() => _DogBreedsListViewScreenState();
}

class _DogBreedsListViewScreenState extends State<DogBreedsListViewScreen> {
  PokeListViewmodel? viewModel;
  @override
  void initState() {
    viewModel = Provider.of<PokeListViewmodel>(context, listen: false);
    viewModel?.getAllDogBreeds();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PokeListViewmodel>(
          builder: (context, vm, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                if(vm.dogListApiState == ApiState.loading) const Center(
                  child: CircularProgressIndicator(),
                ),
                if(vm.dogListApiState == ApiState.success) ListView.builder(
                    key: const Key("listView"),
                    itemCount: vm.dogBreedList?.dogBreedList?.length,
                    itemBuilder: (context, pos) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ListTile(
                            key: Key("listItem${pos+1}"),
                            tileColor: Colors.blueGrey,
                            title: Text(vm.dogBreedList?.dogBreedList?[pos].dogBreedAttrs?.name ?? "No Name",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ));
                    }),
              ],
            );
          }
      ),
    );
  }
}
