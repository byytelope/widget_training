import "package:flutter/material.dart";

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  String _text = "What's on your mind?";
  final TextEditingController _controller = TextEditingController();

  void onPost(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _text = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Input")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 8.0,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    _text,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => _controller.clear(),
                    icon: Icon(Icons.cancel_outlined),
                  ),
                  hintText: "Type here",
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    onPost(_controller.text);
                    _controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text("Post"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
