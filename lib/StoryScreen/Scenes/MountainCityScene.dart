import 'package:arma_tu_cuento/StoryScreen/Scenes/EndScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:get/get.dart';

class MountainCityScene extends StatefulWidget {
  MountainCityScene({Key? key}) : super(key: key);

  @override
  _MountainCitySceneState createState() => _MountainCitySceneState();
}

class _MountainCitySceneState extends State<MountainCityScene> {
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
                imagePath: ConstantsImages.img_mountaincity,
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
                left: 170,
                bottom: 90,
                child: DragTarget(
                  builder: (context, __, _) {
                    return FeedbackContainerImage(
                      width: 150,
                      height: 150,
                      imagePath: ConstantsImages.gif_blue_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      setState(() {});
                    }
                  },
                ),
              ),
              Positioned(
                right: 40,
                bottom: 90,
                child: DragTarget(
                  builder: (context, __, _) {
                    return FeedbackContainerImage(
                      width: 150,
                      height: 150,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == character.imgCharacter) {
                      setState(() {
                        Get.to(EndScene());
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
