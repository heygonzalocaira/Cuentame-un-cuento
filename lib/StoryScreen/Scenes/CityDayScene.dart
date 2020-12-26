import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/CityNightScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:get/get.dart';

class CityDayScene extends StatefulWidget {
  CityDayScene({Key key, this.title}) : super(key: key);
  final String title;

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
                        imagePath: character.img_character,
                      ),
              ),
              Positioned(
                right: 15,
                bottom: 5,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return ContainerImage(
                      width: 120,
                      height: 200,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.img_character) {
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
