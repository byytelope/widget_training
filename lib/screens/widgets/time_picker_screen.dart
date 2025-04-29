import "package:flutter/material.dart";

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _showTimePicker() async {
    await showTimePicker(context: context, initialTime: _selectedTime).then((
      pickedTime,
    ) {
      if (pickedTime != null && pickedTime != _selectedTime) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            Text(
              "Selected Time: ${_selectedTime.format(context).toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            FilledButton(
              onPressed: _showTimePicker,
              child: const Text("Select Time"),
            ),
          ],
        ),
      ),
    );
  }
}
