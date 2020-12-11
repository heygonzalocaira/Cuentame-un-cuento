import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/MountainDessertScene.dart';
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
                right: 10,
                bottom: 5,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return Container(
                      width: 150,
                      height: 200,
                      //decoration: BoxDecoration(
                      //  border: Border.all(
                      //    color:
                      //        Colors.red, //                   <--- border color
                      //    width: 5.0,
                      //  ),
                      //),
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
              Positioned(
                right: 100,
                bottom: 70,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/Characters/sonder_run2.png'),
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
