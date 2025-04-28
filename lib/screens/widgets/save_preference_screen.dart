import "package:flutter/material.dart";

class SavePreferenceScreen extends StatelessWidget {
  const SavePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Save Preference")),
      body: const Center(child: Text("Save Preference Screen Content")),
    );
  }
}
