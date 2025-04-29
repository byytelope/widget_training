import "package:flutter/material.dart";

class TimeScrollingScreen extends StatelessWidget {
  const TimeScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time Scrolling")),
      body: Row(
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              perspective: 0.005,
              diameterRatio: 1.2,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return Center(
                    child: Text(
                      "$index",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              perspective: 0.005,
              diameterRatio: 1.2,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 61,
                builder: (context, index) {
                  return Center(
                    child: Text(
                      index < 10 ? "0$index" : index.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              perspective: 0.005,
              diameterRatio: 1.2,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  return Center(
                    child: Text(
                      index == 0 ? "AM" : "PM",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
