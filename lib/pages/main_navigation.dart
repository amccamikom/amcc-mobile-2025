import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        // Tab 1: Home
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: const Icon(Icons.check_circle_outline),
            title: "Task",
            activeForegroundColor: const Color(0xFF3254FD),
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        // Tab 4: Profile
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: const Icon(Icons.person_outline),
            title: "Profile",
            activeForegroundColor: const Color(0xFF3254FD),
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
