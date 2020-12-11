import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';

class TopButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.undo_outlined),
            color: Colors.blue,
            iconSize: 80,
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.blue,
            iconSize: 80,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Settings"),
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
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop("Successful!");
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}


