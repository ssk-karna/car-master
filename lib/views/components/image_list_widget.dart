import 'package:connectus_dummy/utils/color_set.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomCardWithImages extends StatefulWidget {
  final List<String> imageUrls;

  CustomCardWithImages({required this.imageUrls});

  @override
  _CustomCardWithImagesState createState() => _CustomCardWithImagesState();
}

class _CustomCardWithImagesState extends State<CustomCardWithImages> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, // Adjust the card's elevation as needed
      margin: EdgeInsets.all(16),
      shadowColor: Colors.blue,
      // Add margin around the card

      child: Row(
        children: widget.imageUrls.map((imageUrl) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.all(2), // Add padding between images
              child: Image.network(
                imageUrl,
                width: 100, // Customize image width as needed
                height: 100, // Customize image height as needed
                fit: BoxFit.fill, // Adjust how the image fits within its space
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

