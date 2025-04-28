import "package:flutter/material.dart";

class MessageAndCallScreen extends StatelessWidget {
  const MessageAndCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Message & Call")),
      body: const Center(child: Text("Message & Call Screen Content")),
    );
  }
}
