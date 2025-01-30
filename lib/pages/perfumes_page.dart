import 'package:flutter/material.dart';
import 'product_details_page.dart'; // Import ProductDetailsPage
import 'package:fluttter_projects/widgets/banner.dart'; // Import PerfumeBanner widget
import 'package:fluttter_projects/widgets/custom_footer.dart'; // Import reusable footer

class PerfumesPage extends StatelessWidget {
  final VoidCallback toggleTheme; // Accept toggleTheme function

  PerfumesPage({super.key, required this.toggleTheme});

  final List<Map<String, String>> products = [
    {
      "image": "assets/product_0.jpg",
      "name": "Azzaro TMW",
      "price": "LKR 38,700",
      "description":
          "Azzaro The Most Wanted opens a new olfactory chapter with a Fougere Woody Ambery accord, creating an addictive, sophisticated and magnetic trail.\n"
              "Top notes: Cardamom.\n"
              "Heart notes: Caramel.\n"
              "Base notes: Woody Amber."
    },
    {
      "image": "assets/product_1.jpg",
      "name": "Bently Intense",
      "price": "LKR 16,300",
      "description":
          "Bentley for Men Intense is an oriental spicy fragrance for men. It features a blend of leather, wood, and rum notes for a strong masculine scent."
    },
    {
      "image": "assets/product_2.jpg",
      "name": "CK Be",
      "price": "LKR 32,100",
      "description":
          "Calvin Klein Be is a unisex fragrance with a fresh and clean aroma, featuring notes of bergamot, lavender, white musk, and sandalwood."
    },
    {
      "image": "assets/product_3.jpg",
      "name": "Mont Blanc Exp",
      "price": "LKR 25,000",
      "description":
          "Mont Blanc Explorer is a woody aromatic fragrance, with notes of Italian bergamot, vetiver, and patchouli, representing adventure and elegance."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text(
          "Perfumes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme, // Theme toggle button
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PerfumeBanner(),
            const SizedBox(height: 20),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryCard("assets/mens.png", "For Men", () {}),
                  _categoryCard("assets/womens.png", "For Women", () {}),
                  _categoryCard("assets/demanded.png", "SL's Demanded", () {}),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Top Picks Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Top Picks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _productCard(
                    context,
                    imagePath: product["image"]!,
                    name: product["name"]!,
                    price: product["price"]!,
                    description: product["description"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          CustomFooter(toggleTheme: toggleTheme), // Pass toggleTheme to footer
    );
  }

  ///  `_categoryCard` Method
  Widget _categoryCard(String imagePath, String label, VoidCallback onTap) {
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
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(label,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  /// Pass `description` to `ProductDetailsPage`
  Widget _productCard(
    BuildContext context, {
    required String imagePath,
    required String name,
    required String price,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              imagePath: imagePath,
              name: name,
              price: price,
              description: description, // Pass the description dynamically
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(name,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(price,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(19, 104, 90, 1))),
        ],
      ),
    );
  }
}
