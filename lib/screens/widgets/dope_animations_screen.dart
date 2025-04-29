import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class DopeAnimationsScreen extends StatefulWidget {
  const DopeAnimationsScreen({super.key});

  @override
  State<DopeAnimationsScreen> createState() => _DopeAnimationsScreenState();
}

class _DopeAnimationsScreenState extends State<DopeAnimationsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DOPE Animations")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (!_isBookmarked) {
              _controller.forward();
              setState(() {
                _isBookmarked = true;
              });
            } else {
              _controller.reverse();
              setState(() {
                _isBookmarked = false;
              });
            }
          },
          child: Lottie.network(
            "https://lottie.host/f44dc53c-c7ae-42f8-8ccd-cbb15cfc392a/8MDyCcVehu.json",
            height: 100,
            repeat: false,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
