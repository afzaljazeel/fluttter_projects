import 'package:flutter/material.dart';
import 'product_details_page.dart'; // Import the separate ProductDetailsPage
import 'package:fluttter_projects/widgets/banner.dart'; // Import the PerfumeBanner widget

class ShoesPage extends StatelessWidget {
  ShoesPage({super.key});

  final List<Map<String, String>> products = [
    {
      "image": "assets/shoes1.jpg",
      "name": "Nike Dunk Ironstone",
      "price": "LKR 24000"
    },
    {
      "image": "assets/shoes2.jpg",
      "name": "Nike Blazer Low",
      "price": "LKR 21200"
    },
    {
      "image": "assets/shoes3.jpg",
      "name": "Nike Blazer Mid",
      "price": "LKR 25600"
    },
    {
      "image": "assets/shoes4.jpg",
      "name": "Nike Air Force 1",
      "price": "LKR 23300"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoes"),
        backgroundColor: Colors.white,
        elevation: 0, // Flat AppBar style
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShoeBanner(), // Ensure ShoeBanner is implemented correctly

            const SizedBox(height: 30),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By Brands",
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
                    imagePath: "assets/adidas.jpg",
                    label: "Adidas",
                    onTap: () {
                      // Handle Men's category navigation
                    },
                  ),
                  _categoryCard(
                    imagePath: "assets/new_balance.png",
                    label: "New Balance",
                    onTap: () {
                      // Handle Women's category navigation
                    },
                  ),
                  _categoryCard(
                    imagePath: "assets/nike.jpg",
                    label: "Nike",
                    onTap: () {
                      // Handle Demanded category navigation
                    },
                  ),
                ],
              ),
            ),

            //Top Picks section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Top Picks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
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
                return GestureDetector(
                  onTap: index == 0
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPageShoe(
                                imagePath: product["image"]!,
                                name: product["name"]!,
                                price: product["price"]!,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Column(
                    children: [
                      Image.asset(product["image"]!, height: 150),
                      const SizedBox(height: 10),
                      Text(product["name"]!,
                          style: const TextStyle(fontSize: 16)),
                      Text(product["price"]!,
                          style: const TextStyle(
                              color: Color.fromRGBO(19, 104, 90, 1))),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
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
            height: 100,
            width: 120,
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
