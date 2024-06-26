import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/ForestNightScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:get/get.dart';

class CityNightScene extends StatefulWidget {
  CityNightScene({Key? key}) : super(key: key);

  @override
  _CityNightSceneState createState() => _CityNightSceneState();
}

class _CityNightSceneState extends State<CityNightScene> {
  bool accepted = false;

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
                imagePath: 'assets/Scenes/night.png',
              ),
              MainBackground(
                widthScreen: widthScreen,
                heightScreen: heightScreen,
                imagePath: 'assets/Scenes/city.png',
              ),
              TopButtons(),
              Positioned(
                left: 30,
                bottom: 5,
                child: accepted
                    ? Container()
                    : DraggableImage(
                        width: 120,
                        height: 120,
                        imagePath: character.imgCharacter,
                      ),
              ),
              Positioned(
                right: 10,
                bottom: 5,
                child: DragTarget(
                  builder: (context, __, _) {
                    return ContainerImage(
                      width: 150,
                      height: 150,
                      imagePath: ConstantsImages.gif_moon,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      setState(() {
                        Get.to(ForestNightScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ContainerImage(
                    width: 110,
                    height: 140,
                    imagePath: ConstantsImages.img_sonder),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
