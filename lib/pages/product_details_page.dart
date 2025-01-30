import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductDetailsPage({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 250),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Azzaro The Most Wanted opens a new olfactory chapter with a Fougere Woody Ambery accord, creating an addictive, sophisticated and magnetic trail.\n"
              "Top notes: Cardamom.\n"
              "Heart notes: Caramel.\n"
              "Base notes: Woody Amber.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(19, 104, 90, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

//shoes
class ProductDetailsPageShoe extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductDetailsPageShoe({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 250),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "The Ironstone Nike Dunk Low has an upper that is designed with a mix of suede and leather materials.\n"
              "The colorway features\n"
              "light iron ore\n"
              "ironstone"
              "phantom tones\n\n"
              "A color-block design on the midsole, with the ironstone color transitioning into a darker brown toward the heel.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(19, 104, 90, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
