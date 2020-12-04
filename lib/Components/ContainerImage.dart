import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    Key key,
    @required this.width,
    @required this.height,
    @required this.imagePath,
  }) : super(key: key);

  final double width;
  final double height;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imagePath), fit: BoxFit.fitHeight),
      ),
    );
  }
}
