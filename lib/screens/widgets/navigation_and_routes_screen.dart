import "package:flutter/material.dart";

class NavigationAndRoutesScreen extends StatelessWidget {
  const NavigationAndRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation & Routes")),
      body: Center(
        child: FilledButton(
          onPressed:
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NavigationAndRoutesScreen(),
                ),
              ),
          child: Text("Recursive Replace Navigation"),
        ),
      ),
    );
  }
}
