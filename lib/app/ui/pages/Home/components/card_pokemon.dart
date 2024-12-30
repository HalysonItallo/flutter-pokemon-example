import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final String name;
  final String url;

  const CardPokemon({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffDDDDDD),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Image.network(url),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}
