import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:arma_tu_cuento/iconbutton.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/MenuScreen.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arma tu cuento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(title: 'Arma tu cuento'),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AudioCache _audioCache;

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("assets/music/song_background.mp3"),
    );
    //_audioCache = AudioCache(
    //    prefix: "assets/music/",
    //    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
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
    assetsAudioPlayer.play();
    //_audioCache.loop('song_background.mp3');
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
                    width: 350, height: 150, imagePath: 'assets/init/arma.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ContainerImage(
                    width: 90,
                    height: 120,
                    imagePath: 'assets/init/sonder.png'),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, bottom: 5),
                  width: 80,
                  height: 70,
                  child: Image.asset(
                    'assets/init/cs.png',
                    fit: BoxFit.fill,
                  ),
                ),
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
                  ),
                ),
              ),
              Center(
                  child: ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.blueGrey, // inkwell color
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.play_circle_fill,
                          size: 100,
                          color: Colors.blue,
                        )),
                    onTap: () {
                      //assetsAudioPlayer.stop();
                      //_audioCache.fixedPlayer.stop();
                      Get.to(MenuScreen());
                    },
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
