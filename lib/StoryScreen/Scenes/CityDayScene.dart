import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/CityNightScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:get/get.dart';

class CityDayScene extends StatefulWidget {
  CityDayScene({Key? key}) : super(key: key);

  @override
  _CityDaySceneState createState() => _CityDaySceneState();
}

class _CityDaySceneState extends State<CityDayScene> {
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
                imagePath: 'assets/Scenes/day.png',
              ),
              MainBackground(
                widthScreen: widthScreen,
                heightScreen: heightScreen,
                imagePath: 'assets/Scenes/city.png',
              ),
              TopButtons(),
              Align(
                alignment: Alignment.topCenter,
                child: ContainerImage(
                    width: 110,
                    height: 140,
                    imagePath: ConstantsImages.img_sonder),
              ),
              Positioned(
                left: 30,
                bottom: 5, //  90 120  'assets/Characters/sonder_run.png'
                child: accepted
                    ? Container()
                    : DraggableImage(
                        width: 120,
                        height: 120,
                        imagePath: character.imgCharacter,
                      ),
              ),
              Positioned(
                right: 30,
                bottom: 5, //  90 120  'assets/Characters/sonder_run.png'
                child: accepted
                    ? Container()
                    : DraggableImage(
                        width: 120,
                        height: 120,
                        imagePath: "assets/Objects/moon.png",
                      ),
              ),
              Positioned(
                right: 150,
                top: 0,
                child: DragTarget(
                  builder: (context, __, _) {
                    return ContainerImage(
                      width: 130,
                      height: 150,
                      imagePath: "assets/Objects/circle.gif",
                    );
                  },
                  onAccept: (data) {
                    if (data == "assets/Objects/moon.png") {
                      setState(() {
                        Get.to(CityNightScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
