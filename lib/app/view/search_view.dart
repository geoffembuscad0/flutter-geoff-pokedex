import 'package:flutter/material.dart';
import 'package:my_monsters/app/model/pokemon_model.dart';
import 'package:my_monsters/app/repository/pokemon_repository.dart';
import 'package:my_monsters/app/view/components/pokemon_preview_item.dart';

import '../constants/dimens.dart';
import '../constants/strings.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<PokemonModel> _allPokemon = [];
  List<PokemonModel> _foundPokemon = [];

  @override
  void initState() {
    // at the beginning, all Pokemon are shown
    var pokemonRepository = PokemonRepository();
    _allPokemon = pokemonRepository.getMockData();
    _foundPokemon = _allPokemon;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<PokemonModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all Pokemon
      results = _allPokemon;
    } else {
      results = _allPokemon
          .where((element) => element.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase().trim()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundPokemon = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var styleTitle =
        theme.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingHorizontal,
          vertical: Dimens.paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.search, style: styleTitle),
          const SizedBox(height: Dimens.sizedBoxMedium),
          Row(children: [
            Expanded(
                child: SizedBox(
                    child: TextField(
              decoration: InputDecoration(
                  hintText: Strings.hintSearch,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimens.textFieldBorderRadius)),
                  labelText: Strings.hintPokemon),
              onChanged: (value) => _runFilter(value),
            ))),
          ]),
          const SizedBox(height: Dimens.sizedBoxLarge),
          Expanded(
              child: ListView.separated(
            itemBuilder: (_, index) {
              var pokemonModel = _foundPokemon[index];
              return PokemonPreviewItem(pokemonModel: pokemonModel);
            },
            separatorBuilder: (_, __) => const Divider(
                indent: Dimens.dividerIntent, endIndent: Dimens.dividerIntent),
            itemCount: _foundPokemon.length,
          )),
        ],
      ),
    );
  }
}
