import 'package:arma_tu_cuento/StoryScreen/Scenes/RiverScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';

import 'package:arma_tu_cuento/StoryScreen/Scenes/RiverWoodScene.dart';
import 'package:get/get.dart';

class RiverFailScene extends StatefulWidget {
  RiverFailScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RiverFailSceneState createState() => _RiverFailSceneState();
}

class _RiverFailSceneState extends State<RiverFailScene> {
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
                imagePath: 'assets/Scenes/river.gif',
              ),
              TopButtons(),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerImage(
                        width: 110,
                        height: 140,
                        imagePath: ConstantsImages.img_sonder),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(RiverScene());
                      },
                      child: Text("Escoge otra opción"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
