import "package:flutter/material.dart";

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
        title: Text("404 Not Found"),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.0,
          children: [
            Icon(
              Icons.sentiment_dissatisfied_outlined,
              color: Theme.of(context).colorScheme.onErrorContainer,
              size: 50,
            ),
            Text(
              "Bad route",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
