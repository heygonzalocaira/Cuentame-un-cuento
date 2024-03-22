import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/MainBackground.dart';
//import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/MenuScreen/Components/TopButtons.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/Scenes/CityDayScene.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://image.freepik.com/vector-gratis/ilustracion-vector-dibujos-animados-lindo-corgi-beber-leche-te-boba-bebida-animal-concepto-aislado-vector-estilo-dibujos-animados-plana_138676-1943.jpg',
  'https://image.freepik.com/vector-gratis/lindo-gato-sosteniendo-ilustracion-icono-dibujos-animados-pescado-concepto-icono-comida-animal-aislado-estilo-dibujos-animados-plana_138676-2171.jpg',
  'https://image.freepik.com/vector-gratis/tortuga-linda-sentarse-dibujos-animados-concepto-icono-amor-animal-aislado-estilo-dibujos-animados-plana_138676-2196.jpg',
  'https://image.freepik.com/vector-gratis/lindo-conejo-astronauta-dabbing-volando-zanahoria-rocket-cartoon-icon-illustration-concepto-icono-tecnologia-animal-aislado-estilo-dibujos-animados-plana_138676-2336.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        switch (imgList.indexOf(item)) {
                          case 0:
                            {
                              character.setImageCharacter(
                                  "assets/Characters/dog.gif");
                            }
                            break;
                          case 1:
                            {
                              character.setImageCharacter(
                                  "assets/Characters/cat.gif");
                            }
                            break;
                          case 2:
                            {
                              character.setImageCharacter(
                                  "assets/Characters/tortuga.png");
                            }
                            break;
                          case 3:
                            {
                              character.setImageCharacter(
                                  "assets/Characters/rabiit.gif");
                            }
                            break;
                        }
                        Get.to(CityDayScene());
                      },
                      child: Container(
                          width: 250,
                          height: 500,
                          child: Image.network(item, fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: (() {
                              switch (imgList.indexOf(item)) {
                                case 0:
                                  {
                                    return NameOfCharacter(
                                      name: "Fido el Perro",
                                    );
                                  }

                                case 1:
                                  {
                                    return NameOfCharacter(
                                      name: "Felix el Gato",
                                    );
                                  }

                                case 2:
                                  {
                                    return NameOfCharacter(
                                      name: "Luis la Tortuga",
                                    );
                                  }

                                case 3:
                                  {
                                    return NameOfCharacter(
                                      name: "Max el Conejo",
                                    );
                                  }
                              }
                            }())),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class NameOfCharacter extends StatelessWidget {
  const NameOfCharacter({
    required this.name,
    Key? key,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(enlargeCenterPage: true, height: 300),
            carouselController: _controller,
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  onPressed: () => _controller.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => _controller.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SelectCharacterScreen extends StatefulWidget {
  SelectCharacterScreen({Key? key}) : super(key: key);

  @override
  _SelectCharacterScreenState createState() => _SelectCharacterScreenState();
}

class _SelectCharacterScreenState extends State<SelectCharacterScreen> {
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
                child: Container(
                  width: widthScreen * 0.6,
                  height: heightScreen * 0.7,
                  child: ManuallyControlledSlider(),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
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
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 0),
                    label: Text(
                      "Selecciona un animal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              TopButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
