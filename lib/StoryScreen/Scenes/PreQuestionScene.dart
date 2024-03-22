import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/QuestionScene.dart';
import 'package:get/get.dart';

class PreQuestionScenario extends StatefulWidget {
  PreQuestionScenario({Key? key}) : super(key: key);

  @override
  _PreQuestionScenarioState createState() => _PreQuestionScenarioState();
}

class _PreQuestionScenarioState extends State<PreQuestionScenario> {
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
              Align(
                alignment: Alignment.bottomCenter,
                //alignment: AlignmentDirectional(0.0, -0.5),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  height: 80,
                  width: 320,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(Ouestions()); // Respond to button press
                    },
                    icon: Icon(Icons.add, size: 0),
                    label: Text(
                      "ES HORA DE UN PEQUEÑO \nCUESTIONARIO",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 250,
                  width: 250,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: TextButton(
                      onPressed: () {
                        /*Get.to(ForestDayScene());*/
                      },
                      child: Image.asset('assets/init/gatopregunta.png'),
                    ),
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
