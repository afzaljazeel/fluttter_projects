import 'package:flutter/material.dart';
import 'package:fluttter_projects/pages/app_home_screen.dart';
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  final List pages = [
    const AppHomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  //bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {});
          selectedIndex = value;
        },
        elevation: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
