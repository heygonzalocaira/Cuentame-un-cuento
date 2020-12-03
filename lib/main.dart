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
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/init/arma.png'),
                    fit: BoxFit.fitHeight),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 80,
                height: 100,
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
                child: Image.asset(
                  'assets/init/unsa.png',
                  fit: BoxFit.fill,
                )),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.play_circle_fill),
              color: Colors.blue,
              iconSize: 80,
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
