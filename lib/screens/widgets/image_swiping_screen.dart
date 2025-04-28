import "package:flutter/material.dart";

class ImageSwipingScreen extends StatelessWidget {
  const ImageSwipingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Swiping")),
      body: const Center(child: Text("Image Swiping Screen Content")),
    );
  }
}
