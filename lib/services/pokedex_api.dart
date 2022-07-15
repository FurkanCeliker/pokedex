import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi {
      static const _url ='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/0c457d1c35f46b10e19d4fb0940ce4991c224ac7/pokedex.json'; // static yaptığımda bu sınıftan herhangi bir nesne oluşturmadan url verisine dışarıdan erişim sağlama imkanım olacak.

     static Future<List<PokemonModel>> getPokemonData() async{
       List<PokemonModel> _list =[];
     var result= await Dio().get(_url);
     var pokeList= jsonDecode(result.data)['pokemon']; 
     if(pokeList is List){
       _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
       
     }
     else return [];
    
     return _list;

      }


}