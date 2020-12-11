import 'package:arma_tu_cuento/StoryScreen/CatScenes/MountainCityScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:get/get.dart';

class MountainScene extends StatefulWidget {
  MountainScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MountainSceneState createState() => _MountainSceneState();
}

class _MountainSceneState extends State<MountainScene> {
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
                imagePath: ConstantsImages.img_mountain,
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
                        imagePath: 'assets/Characters/felix_run1.png',
                      ),
              ),
              Positioned(
                right: 140,
                bottom: 40,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return FeedbackContainerImage(
                      width: 130,
                      height: 130,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {
                        Get.to(MountainCityScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 350,
                bottom: 50,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/Characters/sonder_run2.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
