import "package:flutter/material.dart";

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Design")),
      body: const Center(child: Text("Responsive Design Screen Content")),
    );
  }
}
