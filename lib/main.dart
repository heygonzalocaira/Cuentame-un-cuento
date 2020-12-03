import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          Container(
              width: widthScreen,
              height: heightScreen,
              color: Colors.black,
              child: Image.asset(
                'assets/init/background.png',
                fit: BoxFit.fill,
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 250,
                height: 150,
                color: Colors.black,
                child: Image.asset(
                  'assets/init/arma.png',
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: new Icon(
                Icons.play_circle_fill,
                size: 100,
              ),
              highlightColor: Colors.lightBlue,
              onPressed: () {
                print("ah prro");
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 80,
                height: 100,
                color: Colors.black,
                child: Image.asset(
                  'assets/init/sonder.png',
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                width: 80,
                height: 80,
                color: Colors.black,
                child: Image.asset(
                  'assets/init/cs.png',
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: 80,
                height: 80,
                color: Colors.black,
                child: Image.asset(
                  'assets/init/unsa.png',
                  fit: BoxFit.fill,
                )),
          ),
        ],
      ))),
    );
  }
}
