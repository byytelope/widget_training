import "package:flutter/material.dart";

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home_outlined)),
            Tab(icon: Icon(Icons.search_outlined)),
            Tab(icon: Icon(Icons.settings_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              "Tab 1",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Center(
            child: Text(
              "Tab 2",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Center(
            child: Text(
              "Tab 3",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
