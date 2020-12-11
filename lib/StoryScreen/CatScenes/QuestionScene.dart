import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/OptionButton.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/StarScene.dart';
import 'package:get/get.dart';

class Ouestions extends StatefulWidget {
  Ouestions({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OuestionsState createState() => _OuestionsState();
}

class _OuestionsState extends State<Ouestions> {
  bool flag  = false;
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
                alignment: AlignmentDirectional(0.0, -0.9),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  height: 100,
                  width: 430,
                  child: RaisedButton.icon(
                    textColor: Colors.black,
                    color: Colors.white,
                    onPressed: () {
                      Get.to(Ouestions());// Respond to button press
                    },
                    icon: Icon(Icons.add, size: 0),
                    label: Text("¿Qué objeto usó el gato \nFelix para cruzar el rio?",
                    style: TextStyle(fontSize: 25)),
                  ),
                ),
              ),
          Positioned(
                left: 50,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    flag = true;
                    Get.to(Stars());
                  },
                child : AlternativeImage(imagePATH: 'assets/init/sonder.png',)
                  
              ),
          ),
          Positioned(
                left: 260,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    
                  },
                child : AlternativeImage(imagePATH: 'assets/init/sonder.png',)
                  
              ),
          ),
          Positioned(
                left: 470,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    
                  },
                child : AlternativeImage(imagePATH: 'assets/init/sonder.png',)
                  
              ),
          ),
          
        ],
      ))),
    );
  }
}

class AlternativeImage extends StatelessWidget {
  const AlternativeImage({
    Key key,
    this.imagePATH,
  }) : super(key: key);
  final String imagePATH;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
          ChoiceButton(
            words: "a)",
            size_words: 23.0,
            ),
          Positioned(
            left: 50,
            bottom: 40,
            child: ContainerImage(
                width: 90, height: 120, imagePath: imagePATH )),
              //'assets/init/sonder.png'
        ],
    );
  }
}
