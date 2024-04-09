import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/pokemon_model.dart';

class PokemonRepository {
  Future<bool> addFavorite(PokemonModel pokemonModel) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonFavorites = prefs.getStringList('favorites') ?? [];
    jsonFavorites.add(jsonEncode(pokemonModel.toJson()));
    return prefs.setStringList('favorites', jsonFavorites);
  }

  Future<List<PokemonModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonFavorites = prefs.getStringList('favorites') ?? [];
    return jsonFavorites
        .map(
            (jsonFavorites) => PokemonModel.fromJson(jsonDecode(jsonFavorites)))
        .toList();
  }

  Future<bool> saveFavorites(List<PokemonModel> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonFavorites = favorites.map((e) => jsonEncode(e.toJson())).toList();
    return prefs.setStringList('favorites', jsonFavorites);
  }

  List<PokemonModel> getMockData() {
    final pokemonList = <PokemonModel>[
      PokemonModel.initData(
        name: "Bulbasaur",
        pokedex: "0001",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
        type1: "Grass",
        type2: "Poison",
        description:
            "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
        height: 7,
        weight: 69,
      ),
      PokemonModel.initData(
        name: "Ivysaur",
        pokedex: "0002",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/2.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/2.png",
        type1: "Grass",
        type2: "Poison",
        description:
            "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
        height: 10,
        weight: 130,
      ),
      PokemonModel.initData(
        name: "Venusaur",
        pokedex: "0003",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/3.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/3.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/3.png",
        type1: "Grass",
        type2: "Poison",
        description:
            "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.",
        height: 20,
        weight: 1000,
      ),
      PokemonModel.initData(
        name: "Charmander",
        pokedex: "0004",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/4.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/4.png",
        type1: "Fire",
        type2: "None",
        description:
            "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.",
        height: 6,
        weight: 85,
      ),
      PokemonModel.initData(
        name: "Charmeleon",
        pokedex: "0005",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/5.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/5.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/5.png",
        type1: "Fire",
        type2: "None",
        description:
            "It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.",
        height: 11,
        weight: 190,
      ),
      PokemonModel.initData(
        name: "Charizard",
        pokedex: "0006",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/6.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/6.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/6.png",
        type1: "Fire",
        type2: "Flying",
        description:
            "It is said that Charizard’s fire burns hotter if it has experienced harsh battles.",
        height: 17,
        weight: 905,
      ),
      PokemonModel.initData(
        name: "Squirtle",
        pokedex: "0007",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/7.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/7.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/7.png",
        type1: "Water",
        type2: "None",
        description:
            "When it retracts its long neck into its shell, it squirts out water with vigorous force.",
        height: 5,
        weight: 90,
      ),
      PokemonModel.initData(
        name: "Wartortle",
        pokedex: "0008",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/8.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/8.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/8.png",
        type1: "Water",
        type2: "None",
        description:
            "It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.",
        height: 10,
        weight: 225,
      ),
      PokemonModel.initData(
        name: "Blastoise",
        pokedex: "0009",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/9.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/9.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/9.png",
        type1: "Water",
        type2: "None",
        description:
            "It crushes its foe under its heavy body to cause fainting. In a pinch, it will withdraw inside its shell.",
        height: 16,
        weight: 855,
      ),
      PokemonModel.initData(
        name: "Caterpie",
        pokedex: "0010",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/10.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/10.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/10.png",
        type1: "Bug",
        type2: "None",
        description:
            "For protection, it releases a horrible stench from the antenna on its head to drive away enemies.",
        height: 3,
        weight: 29,
      ),
      PokemonModel.initData(
        name: "Metapod",
        pokedex: "0011",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/11.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/11.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/11.png",
        type1: "Bug",
        type2: "None",
        description:
            "It is waiting for the moment to evolve. At this stage, it can only harden, so it remains motionless to avoid attack.",
        height: 7,
        weight: 99,
      ),
      PokemonModel.initData(
        name: "Butterfree",
        pokedex: "0012",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/12.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/12.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/12.png",
        type1: "Bug",
        type2: "Flying",
        description:
            "It loves the nectar of flowers and can locate flower patches that have even tiny amounts of pollen.",
        height: 11,
        weight: 320,
      ),
      PokemonModel.initData(
        name: "Weedle",
        pokedex: "0013",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/13.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/13.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/13.png",
        type1: "Bug",
        type2: "Poison",
        description:
            "Beware of the sharp stinger on its head. It hides in grass and bushes where it eats leaves.",
        height: 3,
        weight: 32,
      ),
      PokemonModel.initData(
        name: "Kakuna",
        pokedex: "0014",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/14.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/14.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/14.png",
        type1: "Bug",
        type2: "Poison",
        description:
            "Able to move only slightly. When endangered, it may stick out its stinger and poison its enemy.",
        height: 6,
        weight: 100,
      ),
      PokemonModel.initData(
        name: "Beedrill",
        pokedex: "0015",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/15.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/15.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/15.png",
        type1: "Bug",
        type2: "Poison",
        description:
            "It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.",
        height: 10,
        weight: 295,
      ),
      PokemonModel.initData(
        name: "Pikachu",
        pokedex: "0025",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png",
        type1: "Electric",
        type2: "None",
        description:
            "When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.",
        height: 4,
        weight: 60,
      ),
      PokemonModel.initData(
        name: "Raichu",
        pokedex: "0026",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/26.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/26.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/26.png",
        type1: "Electric",
        type2: "None",
        description:
            "Its tail discharges electricity into the ground, protecting it from getting shocked.",
        height: 8,
        weight: 300,
      ),
      PokemonModel.initData(
        name: "Lapras",
        pokedex: "0131",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/131.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/131.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/131.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/131.png",
        type1: "Water",
        type2: "Ice",
        description:
            "It loves crossing the sea with people and Pokémon on its back. It understands human speech.",
        height: 25,
        weight: 2200,
      ),
      PokemonModel.initData(
        name: "Snorlax",
        pokedex: "0143",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/143.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/143.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/143.png",
        type1: "Normal",
        type2: "None",
        description:
            "Its stomach can digest any kind of food, even if it happens to be moldy or rotten.",
        height: 21,
        weight: 4600,
      ),
      PokemonModel.initData(
        name: "Mewtwo",
        pokedex: "0150",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/150.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/150.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/150.png",
        type1: "Psychic",
        type2: "None",
        description:
            "Its DNA is almost the same as Mew’s. However, its size and disposition are vastly different.",
        height: 20,
        weight: 1220,
      ),
      PokemonModel.initData(
        name: "Mew",
        pokedex: "0151",
        imageFront:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png",
        imageBack:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/151.png",
        imageFrontShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/151.png",
        imageBackShiny:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/151.png",
        type1: "Psychic",
        type2: "None",
        description:
            "When viewed through a microscope, this Pokémon’s short, fine, delicate hair can be seen.",
        height: 4,
        weight: 40,
      ),
    ];
    return pokemonList;
  }
}
