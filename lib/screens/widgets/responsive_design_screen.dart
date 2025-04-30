import "package:flutter/material.dart";

enum ResponsiveLayout { mobile, tablet, desktop }

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const destinations = [
  ExampleDestination(
    "Messages",
    Icon(Icons.widgets_outlined),
    Icon(Icons.widgets),
  ),
  ExampleDestination(
    "Profile",
    Icon(Icons.format_paint_outlined),
    Icon(Icons.format_paint),
  ),
  ExampleDestination(
    "Settings",
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
];

class MobileLayout extends StatefulWidget {
  const MobileLayout({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Design")),
      body: CommonLayout(responsiveLayout: ResponsiveLayout.mobile),
      drawer: NavigationDrawer(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        children:
            destinations
                .map(
                  (destination) => NavigationDrawerDestination(
                    icon: destination.icon,
                    label: Text(destination.label),
                    selectedIcon: destination.selectedIcon,
                  ),
                )
                .toList(),
      ),
    );
  }
}

class TabletLayout extends StatefulWidget {
  const TabletLayout({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Design")),
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              destinations:
                  destinations
                      .map(
                        (destination) => NavigationRailDestination(
                          icon: destination.icon,
                          label: Text(destination.label),
                          selectedIcon: destination.selectedIcon,
                        ),
                      )
                      .toList(),
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: widget.onDestinationSelected,
              labelType: NavigationRailLabelType.all,
            ),
            Expanded(
              child: CommonLayout(responsiveLayout: ResponsiveLayout.tablet),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Design")),
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              destinations:
                  destinations
                      .map(
                        (destination) => NavigationRailDestination(
                          icon: destination.icon,
                          label: Text(destination.label),
                          selectedIcon: destination.selectedIcon,
                        ),
                      )
                      .toList(),
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: widget.onDestinationSelected,
              labelType: NavigationRailLabelType.all,
            ),
            Expanded(
              child: CommonLayout(responsiveLayout: ResponsiveLayout.desktop),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonLayout extends StatelessWidget {
  const CommonLayout({super.key, required this.responsiveLayout});

  final ResponsiveLayout responsiveLayout;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  responsiveLayout == ResponsiveLayout.desktop ? 4 : 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio:
                  responsiveLayout == ResponsiveLayout.desktop ||
                          responsiveLayout == ResponsiveLayout.mobile
                      ? 1
                      : 2,
            ),
            itemBuilder: (context, index) {
              return Card.filled(
                child: Center(child: Text("Grid Item $index")),
              );
            },
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card.filled(
                child: ListTile(title: Text("List Item $index")),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ResponsiveDesignScreen extends StatefulWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  State<ResponsiveDesignScreen> createState() => _ResponsiveDesignScreenState();
}

class _ResponsiveDesignScreenState extends State<ResponsiveDesignScreen> {
  int _screenIndex = 0;

  void _handleScreenChanged(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobileLayout = constraints.maxWidth < 600;
        final tabletLayout =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
        final desktopLayout = constraints.maxWidth >= 1200;

        if (mobileLayout) {
          return MobileLayout(
            selectedIndex: _screenIndex,
            onDestinationSelected: _handleScreenChanged,
          );
        } else if (tabletLayout) {
          return TabletLayout(
            selectedIndex: _screenIndex,
            onDestinationSelected: _handleScreenChanged,
          );
        } else if (desktopLayout) {
          return DesktopLayout(
            selectedIndex: _screenIndex,
            onDestinationSelected: _handleScreenChanged,
          );
        } else {
          return const Center(child: Text("Unknown Layout"));
        }
      },
    );
  }
}
