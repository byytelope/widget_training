import "package:flutter/material.dart";

class DisableButtonScreen extends StatefulWidget {
  const DisableButtonScreen({super.key});

  @override
  State<DisableButtonScreen> createState() => _DisableButtonScreenState();
}

class _DisableButtonScreenState extends State<DisableButtonScreen> {
  late TextEditingController _controller;
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isButtonActive = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disable Button")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text("Type here"),
                hintText: "Type to enable the button",
              ),
            ),
            FilledButton(
              onPressed:
                  _isButtonActive
                      ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Button Pressed")),
                        );
                        _controller.clear();
                        setState(() {
                          _isButtonActive = false;
                        });
                      }
                      : null,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
