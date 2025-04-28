import "package:flutter/material.dart";

class ListviewBuilderScreen extends StatelessWidget {
  const ListviewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listview Builder")),
      body: const Center(child: Text("Listview Builder Screen Content")),
    );
  }
}
