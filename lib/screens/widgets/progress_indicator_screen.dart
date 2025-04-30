import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class CatFact {
  final String fact;

  CatFact({required this.fact});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(fact: json["fact"]);
  }
}

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  State<ProgressIndicatorScreen> createState() =>
      _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen> {
  late Future<CatFact> _catFact;
  Future<CatFact> _fetchCatFact() async {
    final response = await http.get(Uri.parse("https://catfact.ninja/fact"));

    if (response.statusCode == 200) {
      return CatFact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load cat fact");
    }
  }

  @override
  void initState() {
    super.initState();
    _catFact = _fetchCatFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress Indicator")),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2), () => _catFact),
        builder: (context, snapshot) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card.filled(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16.0,
                      children: [
                        Text(
                          "Cat Fact",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Center(
                          child:
                              snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? const CircularProgressIndicator()
                                  : snapshot.hasError
                                  ? const Text("Error")
                                  : Text(
                                    snapshot.data!.fact,
                                    textAlign: TextAlign.center,
                                  ),
                        ),
                        FilledButton(
                          onPressed:
                              snapshot.connectionState == ConnectionState.done
                                  ? () {
                                    setState(() {
                                      _catFact = _fetchCatFact();
                                    });
                                  }
                                  : null,
                          child: Text("Get New Cat Fact"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
