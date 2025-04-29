import "package:flutter/material.dart";

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime _selectedDate = DateTime.now();

  void _showDatePicker() async {
    await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            Text(
              "Selected Date: ${_selectedDate.toString().split(" ")[0]}",
              style: const TextStyle(fontSize: 20),
            ),
            FilledButton(
              onPressed: _showDatePicker,
              child: const Text("Select Date"),
            ),
          ],
        ),
      ),
    );
  }
}
