import "package:flutter/material.dart";

class DisableButtonScreen extends StatelessWidget {
  const DisableButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disable Button")),
      body: const Center(child: Text("Disable Button Screen Content")),
    );
  }
}
