import "package:flutter/material.dart";

class ImageAssetScreen extends StatelessWidget {
  const ImageAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Asset")),
      body: const Center(child: Text("Image Asset Screen Content")),
    );
  }
}
