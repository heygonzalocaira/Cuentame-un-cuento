import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/OptionButton.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/MenuScreen/MenuScreen.dart';

class Stars extends StatefulWidget {
  Stars({Key key, this.title}) : super(key: key);
  final String title;

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
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                      onPressed: () {
                        Get.to(MenuScreen());
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset('assets/init/grats.png'),
                    ),
                  ),
                ),
              ),// el botton sig esta comentado porque debe ser dimamico
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
          ),
        ),
      ),
    );
  }
}
