import 'package:flutter/material.dart';

class Constants {
Constants._();
static const String appTitle='Pokedex';

static  TextStyle textStyle (){
return const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 48,

);


}
static  TextStyle getPokemonTextStyle (){
return const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 22,

);
}

static  TextStyle getPokemonTypeChipStyle (){
return const TextStyle(
  color: Colors.white,
  
  fontSize: 20,

);
}

  static getPokeInfoTextStyle() {
    return TextStyle(
      fontSize: 20,
      color: Colors.black,

    );
  }
   static getPokeInfoLabelTextStyle() {
    return TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      
    );
  }

}