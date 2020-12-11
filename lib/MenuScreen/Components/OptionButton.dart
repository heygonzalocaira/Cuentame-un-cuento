import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key key,
    @required this.words,
    @required this.size_words,
  }) : super(key: key);

  final String words;
  final double size_words;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
          words,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size_words,
          ),
        ),
      ),
    );
  }
}


class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key key,
    @required this.words,
    @required this.size_words,
  }) : super(key: key);

  final String words;
  final double size_words;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff3b88c3),
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          words,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size_words,
          ),
        ),
      ),
    );
  }
}
