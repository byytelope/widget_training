import "package:flutter/material.dart";
import "package:firebase_messaging/firebase_messaging.dart";

import "package:widget_training/main.dart";
import "package:widget_training/screens/widgets/local_push_notifications_screen.dart";

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    debugPrint("Firebase Messaging Token: $token");

    await initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => const LocalPushNotificationsScreen(),
        settings: RouteSettings(arguments: message),
      ),
    );
  }

  Future<void> initPushNotifications() async {
    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
