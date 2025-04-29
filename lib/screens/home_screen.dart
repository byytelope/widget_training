import "package:flutter/material.dart";

import "package:widget_training/screens/not_found_screen.dart";
import "package:widget_training/screens/widgets/alert_box_screen.dart";
import "package:widget_training/screens/widgets/animation_icon_screen.dart";
import "package:widget_training/screens/widgets/avatar_glow_screen.dart";
import "package:widget_training/screens/widgets/container_screen.dart";
import "package:widget_training/screens/widgets/dark_mode_screen.dart";
import "package:widget_training/screens/widgets/date_picker_screen.dart";
import "package:widget_training/screens/widgets/disable_button_screen.dart";
import "package:widget_training/screens/widgets/dope_animations_screen.dart";
import "package:widget_training/screens/widgets/drag_and_drop_screen.dart";
import "package:widget_training/screens/widgets/drawer_screen.dart";
import "package:widget_training/screens/widgets/expansion_panel_screen.dart";
import "package:widget_training/screens/widgets/face_id_screen.dart";
import "package:widget_training/screens/widgets/gesture_detector_screen.dart";
import "package:widget_training/screens/widgets/hidden_page_screen.dart";
import "package:widget_training/screens/widgets/image_asset_screen.dart";
import "package:widget_training/screens/widgets/image_swiping_screen.dart";
import "package:widget_training/screens/widgets/listview_builder_screen.dart";
import "package:widget_training/screens/widgets/local_push_notifications_screen.dart";
import "package:widget_training/screens/widgets/local_storage_screen.dart";
import "package:widget_training/screens/widgets/message_and_call_screen.dart";
import "package:widget_training/screens/widgets/navigation_and_routes_screen.dart";
import "package:widget_training/screens/widgets/popup_menu_screen.dart";
import "package:widget_training/screens/widgets/progress_indicator_screen.dart";
import "package:widget_training/screens/widgets/provider_page_management_screen.dart";
import "package:widget_training/screens/widgets/responsive_design_screen.dart";
import "package:widget_training/screens/widgets/save_preference_screen.dart";
import "package:widget_training/screens/widgets/slidable_widget_screen.dart";
import "package:widget_training/screens/widgets/tab_bar_screen.dart";
import "package:widget_training/screens/widgets/table_cells_screen.dart";
import "package:widget_training/screens/widgets/text_input_screen.dart";
import "package:widget_training/screens/widgets/text_style_screen.dart";
import "package:widget_training/screens/widgets/time_picker_screen.dart";
import "package:widget_training/screens/widgets/time_scrolling_screen.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final widgetItems = const [
    "Container",
    "Text Input",
    "Text Style",
    "Image Asset",
    "Image Swiping",
    "Slidable Widget",
    "ListView Builder",
    "Alert Box",
    "Gesture Detector",
    "Animation Icon",
    "Drag and Drop",
    "Table Cells",
    "Disable Button",
    "Date Picker",
    "Time Picker",
    "Time Scrolling",
    "Drawer",
    "Tab Bar",
    "Dark Mode",
    "Save Preference",
    "Message & Call",
    "DOPE Animations",
    "Hidden Page (Hidden Drawer)",
    "Popup Menu",
    "Responsive Design",
    "Local Storage",
    "Avatar Glow",
    "Local Push Notifications",
    "Face ID",
    "Provider - Page Management",
    "Expansion Panel",
    "Navigation & Routes",
    "Progress Indicator",
  ];

  Widget _getScreenForItem(String title) {
    switch (title) {
      case "Container":
        return const ContainerScreen();
      case "Text Input":
        return const TextInputScreen();
      case "Text Style":
        return const TextStyleScreen();
      case "Image Asset":
        return const ImageAssetScreen();
      case "Image Swiping":
        return const ImageSwipingScreen();
      case "Slidable Widget":
        return const SlidableWidgetScreen();
      case "ListView Builder":
        return const ListViewBuilderScreen();
      case "Alert Box":
        return const AlertBoxScreen();
      case "Gesture Detector":
        return const GestureDetectorScreen();
      case "Animation Icon":
        return const AnimationIconScreen();
      case "Drag and Drop":
        return const DragAndDropScreen();
      case "Table Cells":
        return const TableCellsScreen();
      case "Disable Button":
        return const DisableButtonScreen();
      case "Date Picker":
        return const DatePickerScreen();
      case "Time Picker":
        return const TimePickerScreen();
      case "Time Scrolling":
        return const TimeScrollingScreen();
      case "Drawer":
        return const DrawerScreen();
      case "Tab Bar":
        return const TabBarScreen();
      case "Dark Mode":
        return const DarkModeScreen();
      case "Save Preference":
        return const SavePreferenceScreen();
      case "Message & Call":
        return const MessageAndCallScreen();
      case "DOPE Animations":
        return const DopeAnimationsScreen();
      case "Hidden Page (Hidden Drawer)":
        return const HiddenPageScreen();
      case "Popup Menu":
        return const PopupMenuScreen();
      case "Responsive Design":
        return const ResponsiveDesignScreen();
      case "Local Storage":
        return const LocalStorageScreen();
      case "Avatar Glow":
        return const AvatarGlowScreen();
      case "Local Push Notifications":
        return const LocalPushNotificationsScreen();
      case "Face ID":
        return const FaceIdScreen();
      case "Provider - Page Management":
        return const ProviderPageManagementScreen();
      case "Expansion Panel":
        return const ExpansionPanelScreen();
      case "Navigation & Routes":
        return const NavigationAndRoutesScreen();
      case "Progress Indicator":
        return const ProgressIndicatorScreen();
      default:
        return const NotFoundScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Widget Training"),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                itemCount: widgetItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final itemTitle = widgetItems[index];
                  return Card.filled(
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            itemTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => _getScreenForItem(itemTitle),
                          ),
                        );
                      },
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
