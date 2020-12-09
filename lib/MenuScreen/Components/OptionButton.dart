import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arma_tu_cuento/StoryScreen/CatScenes/CityDayScene.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key key,
    @required this.words,
  }) : super(key: key);

  final String words;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CityDayScene());
        //Navigator.push(context,
        //    MaterialPageRoute(builder: (context) => SelectAnimalScreen()));
      },
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xff3b88c3),
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(words,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              )),
        ),
      ),
    );
  }
}
