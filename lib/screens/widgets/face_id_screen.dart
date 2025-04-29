import "package:flutter/material.dart";
import "package:widget_training/services/local_auth_service.dart";

class FaceIdScreen extends StatefulWidget {
  const FaceIdScreen({super.key});

  @override
  State<FaceIdScreen> createState() => _FaceIdScreenState();
}

class _FaceIdScreenState extends State<FaceIdScreen> {
  bool _authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face ID")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            Text(
              _authenticated ? "Authenticated" : "Not authenticated",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            FilledButton(
              onPressed: () async {
                final auth = await LocalAuthService.authenticate();

                setState(() {
                  _authenticated = auth;
                });
              },
              child: const Text("Authenticate"),
            ),
          ],
        ),
      ),
    );
  }
}
