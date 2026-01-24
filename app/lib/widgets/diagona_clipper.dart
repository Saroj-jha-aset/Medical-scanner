import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // Top-right
    path.lineTo(size.width, 0);

    // Right side down
    path.lineTo(size.width, size.height * 0.75);

    //Traingle point(center bottom)
    path.lineTo(size.width*0.6, size.height*0.55);

   //Left side up
    path.lineTo(0, size.height*1);

    // Back to start
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}