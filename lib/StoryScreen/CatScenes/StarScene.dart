import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/OptionButton.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:get/get.dart';

class Stars extends StatefulWidget {
  Stars({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StarsState createState() => _StarsState();
}

class _StarsState extends State<Stars> {
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
                      Get.to(Stars());// Respond to button press
                    },
                    icon: Icon(Icons.add, size: 0),
                    label: Text("¿Qué objeto usó el gato \nFelix para cruzar el rio?",
                    style: TextStyle(fontSize: 25)),
                  ),
                ),
              ),
        ],
      ))),
    );
  }
}
