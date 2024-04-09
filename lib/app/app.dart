import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geoff_pokedex/app/view/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'My Pokémon',
      theme: systemBrightness == Brightness.dark ? 
        ThemeData.dark(
          useMaterial3: true
        ) : 
        ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
