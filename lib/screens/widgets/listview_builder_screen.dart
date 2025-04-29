import "package:flutter/material.dart";

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = ["Post 1", "Post 2", "Post 3"];
    final stories = ["Story 1", "Story 2", "Story 3", "Story 4", "Story 5"];

    return Scaffold(
      appBar: AppBar(title: const Text("ListView Builder")),
      body: Column(
        children: [
          SizedBox(
            height: 116.0,
            child: ListView.builder(
              itemCount: stories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stories[index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card.filled(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: MediaQuery.of(context).size.width,
                    child: Center(child: Text(posts[index])),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
