import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const InputSearch({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 190, 190, 197),
        borderRadius: BorderRadius.all(
          Radius.circular(80),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.search_outlined),
            SizedBox(
              width: 275,
              height: 20,
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: const InputDecoration.collapsed(
                  hintText: "Search your favorite pokemon",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
