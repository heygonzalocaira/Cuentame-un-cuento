import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://static.guiainfantil.com/pictures/galerias/5740-dibujos-para-colorear-de-los-animales-del-bosque.jpg',
  'https://www.decaninos.com/wp-content/uploads/2020/04/Dibujos-de-perros-para-pintar.jpg',
  'https://png.pngtree.com/element_origin_min_pic/17/04/20/6d113a485984abf7a286b8ed18d91131.jpg',
  'https://2.bp.blogspot.com/-DkM5BID-SA0/VcwGQ7pUc6I/AAAAAAAAAC8/uWb847BEwbE/s1600/dibujos%2Bde%2Banimales%2B4.jpg',
  'https://images.vexels.com/media/users/3/151790/isolated/preview/309df5b97f865f9ebd8e2df44b9e65d7-dibujos-animados-de-animales-de-erizo-by-vexels.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class SelectAnimalScreen extends StatefulWidget {
  SelectAnimalScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SelectAnimalScreenState createState() => _SelectAnimalScreenState();
}

class _SelectAnimalScreenState extends State<SelectAnimalScreen> {
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
          NoonLoopingDemo(),
        ],
      ))),
    );
  }
}

class NoonLoopingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}
