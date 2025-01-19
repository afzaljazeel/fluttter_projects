import 'package:flutter/material.dart';
import 'package:fluttter_projects/utils/colors.dart';

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width,
      color: bannerColor,
    );
  }
}
