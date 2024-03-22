import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/ForestDayScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:get/get.dart';

class ForestNightScene extends StatefulWidget {
  ForestNightScene({Key? key}) : super(key: key);

  @override
  _ForestNightSceneState createState() => _ForestNightSceneState();
}

class _ForestNightSceneState extends State<ForestNightScene> {
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
                imagePath: 'assets/Scenes/nightforest.png',
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
                right: 2,
                bottom: 5,
                child: DragTarget(
                  builder: (context, __, _) {
                    return FeedbackContainerImage(
                      width: 150,
                      height: 180,
                      imagePath: ConstantsImages.gif_leafs,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      setState(() {
                        Get.to(ForestDayScene());
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
