import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballUrl,
            width: UIHelper.calculateImageSize(),
            height: UIHelper.calculateImageSize(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
            child: Hero(
              
              tag: pokemon.id!,
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(Icons.abc),
                      imageUrl: pokemon.img ?? '',
                      height: UIHelper.calculateImageSize(),
                      width: UIHelper.calculateImageSize(),
                      placeholder:(context,url)=>CircularProgressIndicator(color: Colors.red,) ,
                    ),
            )),
      ],
    );
  }
}
