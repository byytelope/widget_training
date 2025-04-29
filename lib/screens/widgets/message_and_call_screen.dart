import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class MessageAndCallScreen extends StatelessWidget {
  const MessageAndCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final smsUri = Uri(scheme: "sms", path: "+60147072848");
    final phoneUri = Uri(scheme: "tel", path: "+60147072848");

    return Scaffold(
      appBar: AppBar(title: const Text("Message & Call")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            FilledButton.icon(
              icon: Icon(Icons.message_outlined),
              label: Text("Message"),
              onPressed: () async {
                if (await canLaunchUrl(smsUri)) {
                  await launchUrl(smsUri);
                } else {
                  throw "Could not launch $smsUri";
                }
              },
            ),
            FilledButton.icon(
              icon: Icon(Icons.call_outlined),
              label: Text("Call"),
              onPressed: () async {
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                } else {
                  throw "Could not launch $phoneUri";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
