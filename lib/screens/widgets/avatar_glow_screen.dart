import "package:flutter/material.dart";

class AvatarGlowScreen extends StatelessWidget {
  const AvatarGlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Avatar Glow")),
      body: const Center(child: Text("Avatar Glow Screen Content")),
    );
  }
}
