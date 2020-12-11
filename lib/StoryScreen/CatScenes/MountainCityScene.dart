import 'package:arma_tu_cuento/StoryScreen/CatScenes/EndScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:get/get.dart';

class MountainCityScene extends StatefulWidget {
  MountainCityScene({Key key, this.title}) : super(key: key);
  final String title;

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
                        imagePath: 'assets/Characters/felix_run1.png',
                      ),
              ),
              Positioned(
                left: 170,
                bottom: 90,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return FeedbackContainerImage(
                      width: 150,
                      height: 150,
                      imagePath: ConstantsImages.gif_blue_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {});
                    }
                  },
                ),
              ),
              Positioned(
                right: 40,
                bottom: 90,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return FeedbackContainerImage(
                      width: 150,
                      height: 150,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {
                        Get.to(EndScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 250,
                bottom: 80,
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
