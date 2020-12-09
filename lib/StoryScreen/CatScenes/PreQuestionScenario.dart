import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/BottomButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/ForestDayScene.dart';
import 'package:get/get.dart';

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
          /*Center(
            child: ContainerImage(
              width: 400,
              height: 150,
              imagePath: 'assets/init/finhistoria.png',
            ),
          ),*/
          Center(
              child: Container(
                  child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: FlatButton(
                          onPressed: () {
                            Get.to(ForestDayScene());
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset('assets/init/finhistoria.png'))))),
          Positioned(
              left: 100,
              bottom: 5,
              child: ContainerImage(
                  width: 120,
                  height: 120,
                  imagePath: 'assets/Characters/felix_run1.png')),
          Positioned(
              right: 100,
              bottom: 5,
              child: ContainerImage(
                  width: 90,
                  height: 120,
                  imagePath: 'assets/Characters/sonder_run2.png')),
          BottomButtons(), // el botton sig esta comentado porque debe ser dimamico
          Positioned(
            right: 250,
            child: IconButton(
              // el boton debe dar a la siguiente pantalla
              icon: Icon(Icons.navigate_next),
              color: Colors.blue,
              iconSize: 80,
              onPressed: () {},
            ),
          ),
        ],
      ))),
    );
  }
}
