import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/ForestDayScene.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:get/get.dart';

class ForestNightScene extends StatefulWidget {
  ForestNightScene({Key key, this.title}) : super(key: key);
  final String title;

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
                        imagePath: 'assets/Characters/felix_run1.png',
                      ),
              ),
              Positioned(
                right: 10,
                bottom: 5,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return Container(
                      width: 100,
                      height: 200,
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {
                        Get.to(ForestDayScene());
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 250,
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
