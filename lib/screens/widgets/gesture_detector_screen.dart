import "package:flutter/material.dart";

class GestureDetectorScreen extends StatelessWidget {
  const GestureDetectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gesture Detector")),
      body: const Center(child: Text("Gesture Detector Screen Content")),
    );
  }
}
