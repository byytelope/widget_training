import "package:flutter/material.dart";
import "package:hive_ce_flutter/hive_flutter.dart";

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({super.key});

  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreenState();
}

class _LocalStorageScreenState extends State<LocalStorageScreen> {
  final _myBox = Hive.box("mybox");
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Storage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name == null ? "No name set" : "Name: $name",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.0,
              children: [
                FilledButton(
                  onPressed: () {
                    setState(() {
                      name = _myBox.get("local_storage_name");
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          name == null
                              ? "Write to local storage first"
                              : "Read name: $name",
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text("Read"),
                ),
                FilledButton(
                  onPressed: () {
                    _myBox.put("local_storage_name", "John Doe");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Successfully wrote name to local storage",
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text("Write"),
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      _myBox.delete("local_storage_name");
                      name = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Successfully deleted name from local storage",
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
