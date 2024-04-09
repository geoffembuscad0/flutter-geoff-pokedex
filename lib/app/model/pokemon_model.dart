class PokemonModel {
  String name = "";
  String pokedex = "";
  String imageFront = "";
  String imageBack = "";
  String imageFrontShiny = "";
  String imageBackShiny = "";
  String type1 = "";
  String type2 = "";
  String description = "";
  int height = 0;
  int weight = 0;

  PokemonModel.initData({
    required this.name,
    required this.pokedex,
    required this.imageFront,
    required this.imageBack,
    required this.imageFrontShiny,
    required this.imageBackShiny,
    required this.type1,
    required this.type2,
    required this.description,
    required this.height,
    required this.weight,
  });

  PokemonModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    pokedex = json['pokedex'];
    imageFront = json['imageFront'];
    imageBack = json['imageBack'];
    imageFrontShiny = json['imageFrontShiny'];
    imageBackShiny = json['imageBackShiny'];
    type1 = json['type1'];
    type2 = json['type2'];
    description = json['description'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pokedex': pokedex,
      'imageFront': imageFront,
      'imageBack': imageBack,
      'imageFrontShiny': imageFrontShiny,
      'imageBackShiny': imageBackShiny,
      'type1': type1,
      'type2': type2,
      'description': description,
      'height': height,
      'weight': weight,
    };
  }
}
