import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_monsters/app/model/pokemon_model.dart';
import 'package:my_monsters/app/repository/pokemon_repository.dart';

import '../constants/dimens.dart';
import '../constants/strings.dart';

class DetailsView extends StatefulWidget {
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

  DetailsView(
      {super.key,
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
      required this.weight});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final PokemonRepository pokemonRepository = PokemonRepository();
  final bool favoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var styleName =
        theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
    var stylePokedex = theme.textTheme.titleMedium!.copyWith();
    var styleIntro =
        theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    var styleDescription = theme.textTheme.bodyLarge!.copyWith();

    IconData iconFav = Icons.favorite_rounded;
    IconData iconNoFav = Icons.favorite_outline_rounded;

    PokemonModel pokemonModel = PokemonModel.initData(
      name: widget.name,
      pokedex: widget.pokedex,
      imageFront: widget.imageFront,
      imageBack: widget.imageBack,
      imageFrontShiny: widget.imageFrontShiny,
      imageBackShiny: widget.imageBackShiny,
      type1: widget.type1,
      type2: widget.type2,
      description: widget.description,
      height: widget.height,
      weight: widget.weight,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pokemonRepository.addFavorite(pokemonModel);
          });
        },
        child: Icon(favoriteIcon ? iconFav : iconNoFav),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingHorizontal,
              vertical: Dimens.paddingVertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(imageUrl: widget.imageBack),
                  Column(
                    children: [
                      Text(
                        widget.name,
                        style: styleName,
                      ),
                      Text(
                        Strings.pokedex + widget.pokedex,
                        style: stylePokedex,
                      )
                    ],
                  ),
                  CachedNetworkImage(imageUrl: widget.imageFront),
                ],
              ),
              const SizedBox(height: Dimens.sizedBoxLarge),
              Row(
                children: [
                  Text(Strings.type1, style: styleIntro),
                  Text(widget.type1, style: styleDescription),
                  const SizedBox(width: Dimens.sizedBoxLarge),
                  Text(Strings.type2, style: styleIntro),
                  Text(widget.type2, style: styleDescription)
                ],
              ),
              const SizedBox(height: Dimens.sizedBoxSmall),
              Row(
                children: [
                  Text(Strings.height, style: styleIntro),
                  Text(
                      widget.height.toString() +
                          Strings.heightMeasurementUnit,
                      style: styleDescription),
                ],
              ),
              const SizedBox(height: Dimens.sizedBoxSmall),
              Row(
                children: [
                  Text(Strings.weight, style: styleIntro),
                  Text(
                      widget.weight.toString() +
                          Strings.weightMeasurementUnit,
                      style: styleDescription)
                ],
              ),
              const SizedBox(height: Dimens.sizedBoxLarge),
              Text(Strings.description, style: styleIntro),
              Text(
                widget.description,
                style: styleDescription,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: Dimens.sizedBoxLarge),
              Align(
                  alignment: Alignment.center,
                  child: Text(Strings.shiny, style: styleIntro)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(imageUrl: widget.imageBackShiny),
                  CachedNetworkImage(imageUrl: widget.imageFrontShiny),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
