import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/MenuScreen/MenuScreen.dart';

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
              Get.to(MenuScreen());
            },
          ),
          Expanded(
            child: SizedBox(),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.blue,
            iconSize: 80,
            onPressed: () {
              print("Settings");
            },
          ),
        ],
      ),
    );
  }
}
