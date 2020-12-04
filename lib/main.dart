import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arma_tu_cuento/iconbutton.dart';
import 'package:arma_tu_cuento/MainBackground.dart';
import 'package:arma_tu_cuento/ContainerImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

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
              alignment: Alignment.topCenter,
              child: ContainerImage(
                  width: 350, height: 150, imagePath: 'assets/init/arma.png')),
          Align(
              alignment: Alignment.bottomCenter,
              child: ContainerImage(
                  width: 90, height: 120, imagePath: 'assets/init/sonder.png')),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, bottom: 5),
                width: 80,
                height: 70,
                child: Image.asset(
                  'assets/init/cs.png',
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: const EdgeInsets.only(right: 10.0, bottom: 5),
                width: 70,
                height: 80,
                child: Image.asset(
                  'assets/init/unsa.png',
                  fit: BoxFit.fill,
                )),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.play_circle_fill),
              color: Colors.blue,
              iconSize: 100,
              onPressed: () {
                print("Ah prro");
              },
            ),
          ),
        ],
      ))),
    );
  }
}
