import "package:flutter/material.dart";

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Style")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Text Widget Tutorial",
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              "How to customize and style texts with Flutter :D",
              style: TextStyle(fontSize: 20, color: Colors.pink),
              textAlign: TextAlign.center,
            ),
            Text(
              "Another text widget",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
