import 'package:flutter/material.dart';
import 'package:my_monsters/app/view/favorites_view.dart';
import 'package:my_monsters/app/view/search_view.dart';

import '../../constants/dimens.dart';
import '../../constants/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  var navigationColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case Dimens.optionSearchView:
        page = const SearchView();
        break;
      case Dimens.optionFavoritesView:
        page = const FavoritesView();
        break;
      default:
        throw UnimplementedError(
            Strings.noWidgetFor + selectedIndex.toString());
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ColoredBox(
            color: navigationColor,
            child: AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: Dimens.durationMilliseconds),
              child: page,
            ),
          )),
          NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.search_rounded),
                  label: Strings.search),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border_rounded),
                  label: Strings.favorites),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          )
        ],
      ),
    );
  }
}
