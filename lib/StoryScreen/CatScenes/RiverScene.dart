import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/EndScene.dart';
import 'package:arma_tu_cuento/ConstantsImages/ConstantsImages.dart';
import 'package:get/get.dart';
import 'dart:math';

class RiverScene extends StatefulWidget {
  RiverScene({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RiverSceneState createState() => _RiverSceneState();
}

class _RiverSceneState extends State<RiverScene> {
  final Map<String, bool> score = {};

  final Map choices = {
    ConstantsImages.img_ball: Colors.green,
    ConstantsImages.img_bottle: Colors.yellow,
    ConstantsImages.img_wood: Colors.red,
  };

  Offset pos = Offset(50, 50);
  Color warnaBg = Colors.grey;
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
                left: 100,
                bottom: 5,
                child: ContainerImage(
                    width: 120,
                    height: 120,
                    imagePath: 'assets/Characters/felix_run1.png'),
              ),
              Positioned(
                right: 100,
                bottom: 5,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/Characters/sonder_run2.png'),
              ),
              BottomButtons(),
              Positioned(
                left: 30,
                bottom: 170,
                child: Container(
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 25,
                bottom: 190,
                child: accepted
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: choices.keys.map((images) {
                          return Draggable<String>(
                            data: images,
                            child: FeedbackContainerImage(
                              image: images,
                            ), // user's wiew when they're not hace interactions
                            feedback: FeedbackContainerImage(
                              image: images,
                            ), // when the user start to drag
                            childWhenDragging:
                                Container(), // when//display the original child when it's being dragged now
                          );
                        }).toList()),
              ),
              Positioned(
                bottom: 50,
                left: 350,
                child: DragTarget(
                  builder: (context, List<String> data, rj) {
                    return Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: warnaBg,
                      ),
                    );
                  },
                  onAccept: (data) {
                    if (data == 'assets/Objects/wood.png') {
                      setState(() {
                        warnaBg = Colors.blue[700];
                        accepted = true;
                      });
                    }
                  },
                ),
              ),
              Positioned(
                right: 250,
                child: IconButton(
                  // el boton debe dar a la siguiente pantalla
                  icon: Icon(Icons.navigate_next),
                  color: Colors.blue,
                  iconSize: 80,
                  onPressed: () {
                    Get.to(EndScene());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackContainerImage extends StatelessWidget {
  FeedbackContainerImage({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 100,
        height: 65,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
// ejemplo para mover objetos
//Positioned(
//                top: 50,
//                bottom: 150,
//                child: accepted
//                    ? Container()
//                    : Draggable(
//                        feedback: Container(
//                          color: Colors.blue[100],
//                          width: 100,
//                          height: 100,
//                        ),
//                        child: Container(
//                          color: Colors.blue,
//                          height: 100,
//                          width: 100,
//                        ),
//                        childWhenDragging: Container(),
//                        data: "kotak",
//                      ),
//              ),
//              Positioned(
//                top: 100,
//                left: 400,
//                child: DragTarget(
//                  builder: (context, List<String> data, rj) {
//                    return Container(
//                      color: warnaBg,
//                      width: 100,
//                      height: 100,
//                    );
//                  },
//                  onAccept: (data) {
//                    if (data == 'kotak') {
//                      setState(() {
//                        warnaBg = Colors.blue[700];
//                        accepted = true;
//                      });
//                    }
//                  },
//                ),
//              ),
