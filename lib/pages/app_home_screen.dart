// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            //for header
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/comp_logo.png",
                      height: 40,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Iconsax.shopping_bag,
                          size: 28,
                        ),
                        Positioned(
                            right: -3,
                            top: -5,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                )),

            //hero section
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
