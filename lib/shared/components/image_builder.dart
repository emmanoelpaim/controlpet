import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    required this.imagePath,
    this.imgWidth = 100,
    this.imgheight = 100,
  });

  final String imagePath;
  final double imgWidth;
  final double imgheight;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: imgWidth,
      height: imgheight,
    );
  }
}
