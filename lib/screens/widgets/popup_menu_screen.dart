import "package:flutter/material.dart";

class PopupMenuScreen extends StatelessWidget {
  const PopupMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popup Menu")),
      body: const Center(child: Text("Popup Menu Screen Content")),
    );
  }
}
