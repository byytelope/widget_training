import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:widget_training/services/counter_provider.dart";

class ProviderPageManagementScreen extends StatelessWidget {
  const ProviderPageManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider - Page Management")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.0,
        children: [
          Text("This value is managed by a Provider"),
          Center(
            child: Text(
              counterProvider.value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
