import 'package:flutter/material.dart';
import 'package:fluttter_projects/widgets/banner.dart';
import 'package:fluttter_projects/pages/perfumes_page.dart';
import 'package:fluttter_projects/pages/shoes_page.dart';
import 'package:fluttter_projects/widgets/custom_footer.dart';
import 'package:iconsax/iconsax.dart';

class AppHomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme; //  Accept toggleTheme

  const AppHomeScreen({super.key, required this.toggleTheme});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/comp_logo.png", height: 40),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                            Icons.brightness_6), // Theme Toggle Button
                        onPressed: widget.toggleTheme, //  Call toggleTheme
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Iconsax.shopping_bag, size: 28),
                          Positioned(
                            right: -3,
                            top: -5,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Text("3",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Hero Banner
            const HeroBanner(),

            const SizedBox(height: 20),

            // Categories Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Shop by Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  TextButton(
                    onPressed: () {
                      debugPrint("See all clicked");
                    },
                    child: const Text("See all",
                        style: TextStyle(fontSize: 16, color: Colors.black45)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _categoryCard(
                    context,
                    imagePath: "assets/perfumes.png",
                    label: "Perfumes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PerfumesPage(
                                toggleTheme:
                                    widget.toggleTheme)), //  Pass toggleTheme
                      );
                    },
                  ),
                  _categoryCard(
                    context,
                    imagePath: "assets/shoes.jpg",
                    label: "Shoes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoesPage(
                                toggleTheme:
                                    widget.toggleTheme)), //  Pass toggleTheme
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
          toggleTheme: widget.toggleTheme), //  Pass toggleTheme to footer
    );
  }

  Widget _categoryCard(BuildContext context,
      {required String imagePath,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
