import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import "package:courier_client_app/utils/utils.dart";

// screens
import 'package:courier_client_app/screens/screens.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // backgroundColor: AppColors.white,
        // surfaceTintColor: AppColors.white,
        indicatorColor: AppColors.primary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: UIIcon(
              iconData: Icons.home,
              iconColor: AppColors.white,
            ),
            icon: UIIcon(iconData: Icons.home_outlined),
            label: 'HOME',
          ),
          NavigationDestination(
            selectedIcon: UIIcon(
              iconData: Icons.list,
              iconColor: AppColors.white,
            ),
            icon: UIIcon(iconData: Icons.list_alt_outlined),
            label: "Orders",
          ),
          NavigationDestination(
              selectedIcon: UIIcon(
                iconData: Icons.person,
                iconColor: AppColors.white,
              ),
              icon: UIIcon(iconData: Icons.person),
              label: "Profile")
        ],
      ),
      body: const [HomeScreen(), HomeScreen(), HomeScreen()][currentPageIndex],
    );
  }
}
