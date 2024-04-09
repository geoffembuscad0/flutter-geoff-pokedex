import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_monsters/app/constants/dimens.dart';
import 'package:my_monsters/app/model/pokemon_model.dart';
import 'package:my_monsters/app/view/details_view.dart';

import '../../constants/strings.dart';

class PokemonPreviewItem extends StatelessWidget {
  const PokemonPreviewItem({super.key, required this.pokemonModel});

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var styleName =
        theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    var stylePokedex = theme.textTheme.bodyLarge!.copyWith();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsView(
                    name: pokemonModel.name,
                    pokedex: pokemonModel.pokedex,
                    imageFront: pokemonModel.imageFront,
                    imageBack: pokemonModel.imageBack,
                    imageFrontShiny: pokemonModel.imageFrontShiny,
                    imageBackShiny: pokemonModel.imageBackShiny,
                    type1: pokemonModel.type1,
                    type2: pokemonModel.type2,
                    description: pokemonModel.description,
                    height: pokemonModel.height,
                    weight: pokemonModel.weight,
                  )),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.paddingHorizontal,
                  vertical: Dimens.paddingVertical)),
          CachedNetworkImage(imageUrl: pokemonModel.imageFront),
          const SizedBox(width: Dimens.sizedBoxSmall),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokemonModel.name, style: styleName),
              Text(Strings.pokedex + pokemonModel.pokedex,
                  style: stylePokedex)
            ],
          )
        ],
      ),
    );
  }
}
