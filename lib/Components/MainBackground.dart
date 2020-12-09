import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    Key key,
    @required this.widthScreen,
    @required this.heightScreen,
    @required this.imagePath,
  }) : super(key: key);

  final double widthScreen;
  final double heightScreen;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthScreen,
        height: heightScreen,
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ));
  }
}
