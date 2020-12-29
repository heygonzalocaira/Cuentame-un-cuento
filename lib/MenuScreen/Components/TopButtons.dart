import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';
import 'package:arma_tu_cuento/MenuScreen/MenuScreen.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/Constants/ConstantsImages.dart';

class TopButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(MenuScreen());
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: ContainerImage(
                  width: 70, height: 70, imagePath: ConstantsImages.img_back),
            ),
          ),
          //IconButton(
          //  icon: Icon(Icons.undo_outlined),
          //  color: Colors.white,
          //  iconSize: 80,
          //  onPressed: () {
          //
          //  },
          //),
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Opciones"),
                    content: SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          FlutterVolumeSlider(
                            display: Display.HORIZONTAL,
                            sliderActiveColor: Colors.blue,
                            sliderInActiveColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        elevation: 5,
                        child: Text('ACEPTAR'),
                        onPressed: () {
                          Navigator.of(context).pop("Successful!");
                        },
                      )
                    ],
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: ContainerImage(
                  width: 70,
                  height: 70,
                  imagePath: ConstantsImages.img_settings),
            ),
          ),
          //IconButton(
          //  icon: Icon(Icons.settings),
          //  color: Colors.white,
          //  iconSize: 80,
          //  onPressed: () {
          //    showDialog(
          //      context: context,
          //      builder: (context) {
          //        return AlertDialog(
          //          title: Text("Opciones"),
          //          content: SingleChildScrollView(
          //            padding: EdgeInsets.all(10.0),
          //            child: Column(
          //              children: <Widget>[
          //                FlutterVolumeSlider(
          //                  display: Display.HORIZONTAL,
          //                  sliderActiveColor: Colors.blue,
          //                  sliderInActiveColor: Colors.grey,
          //                ),
          //              ],
          //            ),
          //          ),
          //          actions: [
          //            MaterialButton(
          //              elevation: 5,
          //              child: Text('ACEPTAR'),
          //              onPressed: () {
          //                Navigator.of(context).pop("Successful!");
          //              },
          //            )
          //          ],
          //        );
          //      },
          //    );
          //  },
          //),
        ],
      ),
    );
  }
}
