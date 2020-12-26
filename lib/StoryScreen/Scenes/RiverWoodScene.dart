import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/MountainDessertScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:get/get.dart';

class RiverWoodScene extends StatefulWidget {
  RiverWoodScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RiverWoodSceneState createState() => _RiverWoodSceneState();
}

class _RiverWoodSceneState extends State<RiverWoodScene> {
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
                imagePath: 'assets/Scenes/river.png',
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
                right: 0,
                bottom: 5,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return FeedbackContainerImage(
                      width: 120,
                      height: 200,
                      imagePath: ConstantsImages.gif_red_circle,
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {
                        Get.to(MountainDessertScene());
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
              Positioned(
                bottom: 40,
                left: 280,
                child: ContainerImage(
                  width: 160,
                  height: 90,
                  imagePath: ConstantsImages.img_wood,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
