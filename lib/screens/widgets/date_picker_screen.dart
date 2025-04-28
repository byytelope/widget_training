import "package:flutter/material.dart";

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date Picker")),
      body: const Center(child: Text("Date Picker Screen Content")),
    );
  }
}
