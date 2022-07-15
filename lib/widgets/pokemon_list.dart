

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api.dart';
import 'package:pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
   late Future<List<PokemonModel>>
      _pokemonListFuture; // late yazarak aşağıda başlamadan önce initstate edileceğini belirtiyoruz.
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(
              itemCount: _listem.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount( 
                
                crossAxisCount: ScreenUtil().orientation== Orientation.portrait ? 2 : 3,
              ),
             
              itemBuilder: (BuildContext context, int index) {
                 
                return  PokeListItem(pokemon: _listem[index],);
              },
            );

          } else if (snapshot.hasError) {
            return Center(
              child: Text('Veri Gelmedi'),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      );
  }
}

