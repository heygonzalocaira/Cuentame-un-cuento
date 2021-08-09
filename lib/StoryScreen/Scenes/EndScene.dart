import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/PreQuestionScene.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:particles_flutter/particles_flutter.dart';

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
              CircularParticle(
                // key: UniqueKey(),
                awayRadius: 80,
                numberOfParticles: 200,
                speedOfParticles: 1,
                height: heightScreen,
                width: widthScreen,
                onTapAnimation: true,
                particleColor: Colors.white.withAlpha(150),
                awayAnimationDuration: Duration(milliseconds: 600),
                maxParticleSize: 8,
                isRandSize: true,
                isRandomColor: true,
                randColorList: [
                  Colors.red.withAlpha(210),
                  Colors.white.withAlpha(210),
                  Colors.yellow.withAlpha(210),
                  Colors.green.withAlpha(210)
                ],
                awayAnimationCurve: Curves.easeInOutBack,
                enableHover: true,
                hoverColor: Colors.white,
                hoverRadius: 90,
                connectDots: false, //not recommended
              ),
              TopButtons(),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Get.to(PreQuestionScenario());
                  },
                  child: FeedbackContainerImage(
                    width: 300,
                    height: 170,
                    imagePath: ConstantsImages.img_endStory,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
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
