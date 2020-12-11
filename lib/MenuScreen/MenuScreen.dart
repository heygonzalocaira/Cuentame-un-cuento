import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/OptionButton.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/CityDayScene.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
              Positioned(
                left: 200,
                bottom: 150,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/init/sonder.png'),
              ),
              Positioned(
                right: 200,
                bottom: 150,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/init/sonder.png'),
              ),
              Positioned(
                left: 150,
                bottom: 40,
                child: GestureDetector(
                  onTap: () {
                    Get.to(CityDayScene());
                  },
                  child: OptionButton(
                    words: "Crear",
                    size_words: 23.0,
                  ),
                ),
              ),
              Positioned(
                right: 150,
                bottom: 40,
                child: GestureDetector(
                  onTap: () {
                    //Get.to(); //Poner el widget necesario
                  },
                  child: OptionButton(
                    words: "Ver",
                    size_words: 23.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
