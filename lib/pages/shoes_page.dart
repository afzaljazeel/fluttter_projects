import 'package:flutter/material.dart';
import 'product_details_page.dart'; // Import ProductDetailsPageShoe
import 'package:fluttter_projects/widgets/banner.dart'; // Import ShoeBanner widget
import 'package:fluttter_projects/widgets/custom_footer.dart'; // Import reusable footer

class ShoesPage extends StatelessWidget {
  final VoidCallback toggleTheme; // ✅ Accept toggleTheme

  ShoesPage({super.key, required this.toggleTheme});

  final List<Map<String, String>> products = [
    {
      "image": "assets/shoes1.jpg",
      "name": "Nike Dunk Ironstone",
      "price": "LKR 24,000",
      "description":
          "The Ironstone Nike Dunk Low has an upper that is designed with a mix of suede and leather materials.\n"
              "The colorway features light iron ore, ironstone, and phantom tones.\n"
              "A color-block design on the midsole transitions into a darker brown toward the heel."
    },
    {
      "image": "assets/shoes2.jpg",
      "name": "Nike Blazer Low",
      "price": "LKR 21,200",
      "description":
          "The Nike Blazer Low combines vintage styling with modern comfort. Its leather upper and exposed foam tongue provide a classic and stylish look."
    },
    {
      "image": "assets/shoes3.jpg",
      "name": "Nike Blazer Mid",
      "price": "LKR 25,600",
      "description":
          "The Nike Blazer Mid features a retro basketball silhouette with a durable leather upper, suede overlays, and a rubber outsole for traction."
    },
    {
      "image": "assets/shoes4.jpg",
      "name": "Nike Air Force 1",
      "price": "LKR 23,300",
      "description":
          "The Nike Air Force 1 remains a streetwear staple, offering premium leather, Air cushioning, and an iconic silhouette for everyday style."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Slight shadow for separation
        foregroundColor: Colors.black, // Black back button
        title: const Text(
          "Shoes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner
            const ShoeBanner(),

            const SizedBox(height: 20),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By Brands",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryCard(
                    imagePath: "assets/adidas.jpg",
                    label: "Adidas",
                    onTap: () {},
                  ),
                  _categoryCard(
                    imagePath: "assets/new_balance.png",
                    label: "New Balance",
                    onTap: () {},
                  ),
                  _categoryCard(
                    imagePath: "assets/nike.jpg",
                    label: "Nike",
                    onTap: () {},
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // Grid View for Top Picks
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
          CustomFooter(toggleTheme: toggleTheme), // ✅ Pass toggleTheme
    );
  }

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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

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
              description: description,
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
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
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
