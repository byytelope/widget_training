import "package:flutter/material.dart";

class AlertBoxScreen extends StatelessWidget {
  const AlertBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert Box")),
      body: Center(
        child: FilledButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Alert"),
                  content: const Text("This is an alert box."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Show Alert"),
        ),
      ),
    );
  }
}
