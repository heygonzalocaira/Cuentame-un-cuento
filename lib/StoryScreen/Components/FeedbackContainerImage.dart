import 'package:flutter/material.dart';

class FeedbackContainerImage extends StatelessWidget {
  FeedbackContainerImage({
    required this.width,
    required this.height,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
