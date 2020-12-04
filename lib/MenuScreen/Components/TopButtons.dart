import 'package:flutter/material.dart';

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
              Navigator.pop(context);
            },
          ),
          Expanded(child: SizedBox()),
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
