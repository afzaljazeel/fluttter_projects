import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      child: Image.asset(
        "assets/banner.jpg",
        fit: BoxFit.cover, // To Ensures the image covers the container
      ),
    );
  }
}

class PerfumeBanner extends StatelessWidget {
  const PerfumeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      child: Image.asset(
        "assets/pbanner.jpg",
        fit: BoxFit.cover, // To Ensures the image covers the container
      ),
    );
  }
}

class ShoeBanner extends StatelessWidget {
  const ShoeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      child: Image.asset(
        "assets/sbanner.png",
        fit: BoxFit.cover, // To Ensures the image covers the container
      ),
    );
  }
}
