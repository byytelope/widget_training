import "package:flutter/material.dart";

class ImageAssetScreen extends StatelessWidget {
  const ImageAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Asset")),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Image.asset("images/cat.jpg", fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
