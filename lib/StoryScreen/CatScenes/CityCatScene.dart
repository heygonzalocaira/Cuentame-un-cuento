import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';

class CityCatScene extends StatefulWidget {
  CityCatScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CityCatSceneState createState() => _CityCatSceneState();
}

class _CityCatSceneState extends State<CityCatScene> {
  @override
  Widget build(BuildContext context) {
    double widthScreen;
    double heightScreen;
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          MainBackground(
            widthScreen: widthScreen,
            heightScreen: heightScreen,
            imagePath: 'assets/Scenes/day.png',
          ),
          MainBackground(
            widthScreen: widthScreen,
            heightScreen: heightScreen,
            imagePath: 'assets/Scenes/city.png',
          ),
          TopButtons(),
          Positioned(
              left: 100,
              bottom: 20,
              child: ContainerImage(
                  width: 120,
                  height: 120,
                  imagePath: 'assets/Characters/felix_run1.png')),
          Positioned(
              right: 100,
              bottom: 50,
              child: ContainerImage(
                  width: 90,
                  height: 120,
                  imagePath: 'assets/Characters/sonder_run.png')),
          BottomButtons(), // el botton sig esta comentado porque debe ser dimamico
        ],
      ))),
    );
  }
}
