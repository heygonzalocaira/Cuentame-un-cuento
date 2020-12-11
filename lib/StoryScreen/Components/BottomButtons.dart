import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 250,
          ),
          IconButton(
            icon: Icon(Icons.navigate_before),
            color: Colors.blue,
            iconSize: 80,
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: SizedBox(),
          ),
          //IconButton( // el boton debe dar a la siguiente pantalla
          //  icon: Icon(Icons.navigate_next),
          //  color: Colors.blue,
          //  iconSize: 80,
          //  onPressed: () {},
          //),
        ],
      ),
    );
  }
}
