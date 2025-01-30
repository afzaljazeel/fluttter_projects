import 'package:flutter/material.dart';
import 'package:fluttter_projects/pages/app_home_screen.dart'; // Home screen
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends StatefulWidget {
  final int selectedIndex; // To set the default tab (e.g., Home)
  final Widget? body; // Optional custom content for the main screen

  const AppMainScreen({
    super.key,
    this.selectedIndex = 0, // Default to Home tab
    this.body,
  });

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  late int selectedIndex;

  // Only Home tab is functional for now
  final List<Widget> pages = [
    const AppHomeScreen(), // Home Screen
    const Scaffold(
        body: Center(child: Text("Cart Page Not Linked"))), // Placeholder
    const Scaffold(
        body: Center(child: Text("Profile Page Not Linked"))), // Placeholder
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex; // Initialize with the passed index
  }

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
          if (value == 0) {
            // Home tab is functional
            setState(() {
              selectedIndex = value;
            });
          } else {
            // Show a message for inactive tabs
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("This tab is not linked yet.")),
            );
          }
        },
        elevation: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
      ),
      body: widget.body ??
          pages[selectedIndex], // Show custom content or default page
    );
  }
}
