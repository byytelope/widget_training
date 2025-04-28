import "package:flutter/material.dart";

class TableCellsScreen extends StatelessWidget {
  const TableCellsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Table Cells")),
      body: const Center(child: Text("Table Cells Screen Content")),
    );
  }
}
