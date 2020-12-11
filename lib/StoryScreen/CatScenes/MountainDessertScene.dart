import 'package:arma_tu_cuento/StoryScreen/CatScenes/MountainScene.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/DraggableImage.dart';
import 'package:get/get.dart';

class MountainDessertScene extends StatefulWidget {
  MountainDessertScene({Key key, this.title}) : super(key: key);
  final String title;

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
                        imagePath: 'assets/Characters/felix_run1.png',
                      ),
              ),
              Positioned(
                left: 90,
                top: 25,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Colors.red, //                   <--- border color
                          width: 5.0,
                        ),
                      ),
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
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
                top: 25,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors
                              .yellow, //                   <--- border color
                          width: 5.0,
                        ),
                      ),
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Characters/felix_run1.png') {
                      setState(() {
                        print("Camino equivocado");
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 350,
                bottom: 100,
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
