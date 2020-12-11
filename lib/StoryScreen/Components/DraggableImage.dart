import 'package:flutter/material.dart';
import 'package:arma_tu_cuento/Components/ContainerImage.dart';
import 'package:arma_tu_cuento/StoryScreen/Components/FeedbackContainerImage.dart';

class DraggableImage extends StatelessWidget {
  DraggableImage({
    Key key,
    this.width,
    this.height,
    this.imagePath,
  }) : super(key: key);

  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: FeedbackContainerImage(
        width: width,
        height: height,
        imagePath: imagePath,
      ),
      child: FeedbackContainerImage(
        width: width,
        height: height,
        imagePath: imagePath,
      ),
      childWhenDragging: Container(),
      data: imagePath,
    );
  }
}
