import 'package:arma_tu_cuento/StoryScreen/Scenes/MountainDessertFailScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/MountainScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';

class MountainDessertScene extends StatefulWidget {
  MountainDessertScene({Key? key}) : super(key: key);

  @override
  _MountainDessertSceneState createState() => _MountainDessertSceneState();
}

class _MountainDessertSceneState extends State<MountainDessertScene> {
  final Map choices = {
    ConstantsImages.img_ball: Colors.green,
    ConstantsImages.img_bottle: Colors.yellow,
    ConstantsImages.img_wood: Colors.red,
  };

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
                imagePath: ConstantsImages.img_mountaindessert,
              ),
              TopButtons(),
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
                left: 90,
                top: 50,
                child: DragTarget(
                  builder: (context, __, _) {
                    return FeedbackContainerImage(
                      width: 180,
                      height: 180,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      setState(() {
                        Get.to(MountainScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 90,
                top: 50,
                child: DragTarget(
                  builder: (context, __, _) {
                    return FeedbackContainerImage(
                      width: 180,
                      height: 180,
                      imagePath: ConstantsImages.gif_blue_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      Get.to(MountainDessertFailScene());
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
