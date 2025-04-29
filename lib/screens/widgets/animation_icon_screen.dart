import "package:flutter/material.dart";

class AnimationIconScreen extends StatefulWidget {
  const AnimationIconScreen({super.key});

  @override
  State<AnimationIconScreen> createState() => _AnimationIconScreenState();
}

class _AnimationIconScreenState extends State<AnimationIconScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPlaying = false;

  void _toggleAnimation() {
    if (!_isPlaying) {
      _animationController.forward();
      _isPlaying = true;
    } else {
      _animationController.reverse();
      _isPlaying = false;
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Icon")),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController,
            size: 150,
          ),
        ),
      ),
    );
  }
}
