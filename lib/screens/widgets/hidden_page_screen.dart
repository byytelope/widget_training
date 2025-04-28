import "package:flutter/material.dart";

class HiddenPageScreen extends StatelessWidget {
  const HiddenPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hidden Page (Hidden Drawer)")),
      body: const Center(child: Text("Hidden Page Screen Content")),
    );
  }
}
