import 'package:flutter/material.dart';
import 'product_details_page.dart'; // Import the ProductDetailsPage
import 'package:fluttter_projects/widgets/banner.dart'; // Import the PerfumeBanner widget
import 'package:fluttter_projects/pages/app_main_screen.dart'; // Import the footer

class PerfumesPage extends StatelessWidget {
  PerfumesPage({super.key});

  // Manually defined product list
  final List<Map<String, String>> products = [
    {
      "image": "assets/product_0.jpg",
      "name": "Azzaro TMW",
      "price": "LKR 38700",
    },
    {
      "image": "assets/product_1.jpg",
      "name": "Bently Intense",
      "price": "LKR 16300",
    },
    {
      "image": "assets/product_2.jpg",
      "name": "CK Be",
      "price": "LKR 32100",
    },
    {
      "image": "assets/product_3.jpg",
      "name": "Mont Blank Exp",
      "price": "LKR 25000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfumes"),
        backgroundColor: Colors.white,
        elevation: 0, // Flat AppBar style
        foregroundColor: Colors.black, // Black text color for the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner Section
            const PerfumeBanner(),

            const SizedBox(height: 20),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 160, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryCard(
                    imagePath: "assets/mens.png",
                    label: "For Men",
                    onTap: () {
                      // Handle Men's category navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("For Men category clicked!")),
                      );
                    },
                  ),
                  _categoryCard(
                    imagePath: "assets/womens.png",
                    label: "For Women",
                    onTap: () {
                      // Handle Women's category navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("For Women category clicked!")),
                      );
                    },
                  ),
                  _categoryCard(
                    imagePath: "assets/demanded.png",
                    label: "SL's Demanded",
                    onTap: () {
                      // Handle Demanded category navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("SL's Demanded category clicked!")),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Top Picks Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Top Picks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Top Picks Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length, // Use the product list count
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 products per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Adjust for product card size
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _productCard(
                    context,
                    imagePath: product["image"]!,
                    name: product["name"]!,
                    price: product["price"]!,
                    isClickable: index == 0, // First product is clickable
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppMainScreen(), // Add footer
    );
  }

  // Widget for Category Card
  Widget _categoryCard({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Product Card
  Widget _productCard(
    BuildContext context, {
    required String imagePath,
    required String name,
    required String price,
    required bool isClickable,
  }) {
    return GestureDetector(
      onTap: isClickable
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    imagePath: imagePath,
                    name: name,
                    price: price,
                  ),
                ),
              );
            }
          : null, // Disable tap for non-clickable products
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(19, 104, 90, 1),
            ),
          ),
        ],
      ),
    );
  }
}
