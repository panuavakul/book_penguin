import 'package:flutter/material.dart';

class PlaceholderImageView extends StatelessWidget {
  // Image to be displayed
  final String imageUrl;
  final IconData placeholderIcon;
  final double height;

  // Constructor
  PlaceholderImageView({
    this.imageUrl = '',
    this.placeholderIcon = Icons.photo,
    this.height
  });

  Widget build(BuildContext context) {
    if (imageUrl != '' && imageUrl != null) {
      return Image.network(imageUrl);
    } else {
      return Icon(
        placeholderIcon,
        size: height ?? 12.0
      );
    }
  }
}