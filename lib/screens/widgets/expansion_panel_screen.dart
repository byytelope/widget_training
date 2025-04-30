import "package:flutter/material.dart";

class ExpansionItem {
  ExpansionItem({required this.headerValue, required this.expandedValue})
    : isExpanded = false;

  String headerValue;
  String expandedValue;
  bool isExpanded;
}

class ExpansionPanelScreen extends StatefulWidget {
  const ExpansionPanelScreen({super.key});

  @override
  State<ExpansionPanelScreen> createState() => _ExpansionPanelScreenState();
}

class _ExpansionPanelScreenState extends State<ExpansionPanelScreen> {
  final _data = List.generate(
    10,
    (index) => ExpansionItem(
      headerValue: "Panel $index",
      expandedValue: "This is item number $index",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expansion Panel")),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _data[panelIndex].isExpanded = isExpanded;
            });
          },
          children:
              _data.map((item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(title: Text(item.headerValue));
                  },
                  body: ListTile(
                    title: Text(item.expandedValue),
                    subtitle: Text("To delete, press trash"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _data.removeWhere(
                            (currentItem) => item == currentItem,
                          );
                        });
                      },
                    ),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
        ),
      ),
    );
  }
}
