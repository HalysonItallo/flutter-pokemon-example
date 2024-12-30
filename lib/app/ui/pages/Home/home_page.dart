import 'package:flutter/material.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/containers/home_container.dart';
import 'package:flutter_pokemon_example/app/ui/pages/Home/home_injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    setupHomeInject();

    return const HomeContainer();
  }
}
