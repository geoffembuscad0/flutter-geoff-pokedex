import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../constants/strings.dart';
import '../model/pokemon_model.dart';
import '../repository/pokemon_repository.dart';
import 'components/pokemon_preview_item.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final PokemonRepository pokemonRepository = PokemonRepository();

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
          Text(Strings.myFavorites, style: styleTitle),
          const SizedBox(height: Dimens.sizedBoxLarge),
          Expanded(
            child: FutureBuilder<List<PokemonModel>>(
              future: pokemonRepository.getFavorites(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(Strings.noFavorites),
                  );
                }
                return ListView.separated(
                  itemBuilder: (_, index) {
                    var pokemonModel = snapshot.data![index];

                    return PokemonPreviewItem(pokemonModel: pokemonModel);
                  },
                  separatorBuilder: (_, __) => const Divider(
                      indent: Dimens.dividerIntent,
                      endIndent: Dimens.dividerIntent),
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
