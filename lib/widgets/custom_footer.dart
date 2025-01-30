import 'package:flutter/material.dart';
import 'package:fluttter_projects/pages/app_home_screen.dart';
import 'package:iconsax/iconsax.dart';

class CustomFooter extends StatelessWidget {
  final VoidCallback toggleTheme; //  Accept toggleTheme

  const CustomFooter({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        border: const Border(
          top: BorderSide(color: Colors.grey, width: 0.5), // Thin border on top
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _footerButton(
            context,
            icon: Iconsax.home,
            label: "Home",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AppHomeScreen(
                        toggleTheme: toggleTheme)), //  Pass toggleTheme
              );
            },
          ),
          _footerButton(context,
              icon: Iconsax.shopping_bag, label: "Cart", onTap: () {}),
          _footerButton(context,
              icon: Iconsax.user, label: "Profile", onTap: () {}),
        ],
      ),
    );
  }

  Widget _footerButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Theme.of(context).iconTheme.color),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
