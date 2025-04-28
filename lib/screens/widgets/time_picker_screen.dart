import "package:flutter/material.dart";

class TimePickerScreen extends StatelessWidget {
  const TimePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time Picker")),
      body: const Center(child: Text("Time Picker Screen Content")),
    );
  }
}
