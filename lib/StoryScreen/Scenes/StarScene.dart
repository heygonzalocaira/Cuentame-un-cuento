import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:arma_tu_cuento/main.dart';
import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';

class Stars extends StatefulWidget {
  Stars({Key? key}) : super(key: key);

  @override
  _StarsState createState() => _StarsState();
}

class _StarsState extends State<Stars> {
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
              Center(
                child: Container(
                  width: 500,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            MainScreen(),
                          );
                        },
                        child: FeedbackContainerImage(
                          width: 500,
                          height: 100,
                          imagePath: 'assets/init/grats.png',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 110,
                            ),
                            ContainerImage(
                              width: 80,
                              height: 80,
                              imagePath: ConstantsImages.img_star,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerImage(
                              width: 80,
                              height: 80,
                              imagePath: ConstantsImages.img_star,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerImage(
                              width: 80,
                              height: 80,
                              imagePath: ConstantsImages.img_star,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ), // el botton sig esta comentado porque debe ser dimamico
            ],
          ),
        ),
      ),
    );
  }
}
