import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/PreQuestionScene.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';

class EndScene extends StatefulWidget {
  EndScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EndSceneState createState() => _EndSceneState();
}

class _EndSceneState extends State<EndScene> {
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
                imagePath: 'assets/init/background.png',
              ),
              TopButtons(),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    Get.to(PreQuestionScenario());
                  },
                  child: FeedbackContainerImage(
                    width: 350,
                    height: 190,
                    imagePath: ConstantsImages.img_endStory,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ContainerImage(
                    width: 220,
                    height: 200,
                    imagePath: ConstantsImages.img_sonder),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
