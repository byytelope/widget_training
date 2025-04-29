import "package:flutter/material.dart";

class PopupMenuScreen extends StatefulWidget {
  const PopupMenuScreen({super.key});

  @override
  State<PopupMenuScreen> createState() => _PopupMenuScreenState();
}

class _PopupMenuScreenState extends State<PopupMenuScreen> {
  late FocusNode _buttonFocusNode;

  @override
  void initState() {
    super.initState();
    _buttonFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popup Menu")),
      body: Center(
        child: MenuAnchor(
          childFocusNode: _buttonFocusNode,
          menuChildren: [
            MenuItemButton(child: Text("About"), onPressed: () {}),
            MenuItemButton(child: Text("Settings"), onPressed: () {}),
            MenuItemButton(child: Text("Help"), onPressed: () {}),
          ],
          builder: (context, controller, child) {
            return FilledButton(
              focusNode: _buttonFocusNode,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: const Text("Open Menu"),
            );
          },
        ),
      ),
    );
  }
}
