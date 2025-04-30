import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";

class LocalPushNotificationsScreen extends StatelessWidget {
  const LocalPushNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    return Scaffold(
      appBar: AppBar(title: const Text("Local Push Notifications")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (message != null)
              Text(
                "Notification Title: ${message.notification?.title}\n"
                "Notification Body: ${message.notification?.body}",
                textAlign: TextAlign.center,
              ),
            Text("Send a notification from firebase console to see it here"),
          ],
        ),
      ),
    );
  }
}
