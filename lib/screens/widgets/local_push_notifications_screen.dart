import "package:flutter/material.dart";

class LocalPushNotificationsScreen extends StatelessWidget {
  const LocalPushNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Push Notifications")),
      body: const Center(
        child: Text("Local Push Notifications Screen Content"),
      ),
    );
  }
}
