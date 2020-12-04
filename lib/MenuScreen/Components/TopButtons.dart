import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.play_circle_fill),
            color: Colors.blue,
            iconSize: 100,
            onPressed: () {},
          ),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(Icons.play_circle_fill),
            color: Colors.blue,
            iconSize: 100,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
