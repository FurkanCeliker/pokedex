import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballUrl)
        : _buildLandscapeBody(context, pokeballUrl);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: 24.h,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PokeTypeName(pokemon: pokemon),
                    Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.25.sw,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child:
              
               Padding(
                 padding:UIHelper.getDefaultPadding(),
                 child: PokeInformation(pokemon: pokemon),
               ),
               ),
            ],
          )),
        ],
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: IconButton(
                iconSize: 24.h,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeTypeName(
            pokemon: pokemon,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  pokeballUrl,
                  fit: BoxFit.fitHeight,
                ),
                right: 0,
                top: 0,
                height: 0.15.sh,
              ),
              Positioned(
                child: PokeInformation(pokemon: pokemon),
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.12.sh,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    height: UIHelper.calculateImageSize(),
                    width: UIHelper.calculateImageSize(),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          )),
        ]),
      ),
    );
  }
}
