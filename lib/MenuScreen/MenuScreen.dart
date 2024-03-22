import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/OptionButton.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/MenuScreen/SelectCharacterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);

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
                imagePath: 'assets/Scenes/bosque.gif',
              ),
              TopButtons(),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: heightScreen * 0.15,
                    ),
                    ContainerImage(
                      width: 160,
                      height: 160,
                      imagePath: ConstantsImages.img_menu_ver,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SelectCharacterScreen());
                      },
                      child: OptionButton(
                        words: "Empecemos",
                        sizeWords: 23.0,
                      ),
                    ),
                  ],
                ),
              ),
              //Positioned(
              //  right: 150,
              //  bottom: 40,
              //  child: Column(
              //    children: [
              //      ContainerImage(
              //        width: 130,
              //        height: 120,
              //        imagePath: ConstantsImages.img_menu_ver,
              //      ),
              //      SizedBox(
              //        height: 10,
              //      ),
              //      GestureDetector(
              //        onTap: () {
              //          //Get.to(); //Poner el widget necesario
              //        },
              //        child: OptionButton(
              //          words: "Ver",
              //          size_words: 23.0,
              //        ),
              //      ),
              //    ],
              //  ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
