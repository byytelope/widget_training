import "package:flutter/material.dart";

class TimeScrollingScreen extends StatelessWidget {
  const TimeScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time Scrolling")),
      body: const Center(child: Text("Time Scrolling Screen Content")),
    );
  }
}
