import "package:avatar_glow/avatar_glow.dart";
import "package:flutter/material.dart";

class AvatarGlowScreen extends StatelessWidget {
  const AvatarGlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Avatar Glow")),
      body: Center(
        child: AvatarGlow(
          glowColor: Theme.of(context).colorScheme.primary,
          duration: const Duration(milliseconds: 2000),
          child: Icon(Icons.menu, size: 40),
        ),
      ),
    );
  }
}
