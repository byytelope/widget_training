import "package:flutter/material.dart";

class TableCellsScreen extends StatelessWidget {
  const TableCellsScreen({super.key});

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    TextStyle textStyle =
        isHeader
            ? const TextStyle(fontWeight: FontWeight.bold)
            : const TextStyle();

    return TableRow(
      children:
          cells
              .map(
                (cell) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(cell, style: textStyle)),
                ),
              )
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Table Cells")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Table(
            border: TableBorder.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            columnWidths: {
              0: const FractionColumnWidth(0.5),
              1: const FractionColumnWidth(0.25),
              2: const FractionColumnWidth(0.25),
            },
            children: [
              buildRow(["Name", "City", "Age"], isHeader: true),
              buildRow(["Sarah", "New York", "21"]),
              buildRow(["Emma", "Sydney", "24"]),
              buildRow(["John", "London", "23"]),
            ],
          ),
        ),
      ),
    );
  }
}
