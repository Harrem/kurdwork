import 'package:flutter/material.dart';

class OvalPicture extends StatelessWidget {
  OvalPicture({Key? key, required this.image, required this.scale})
      : super(key: key);

  Image image;
  double scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scale,
      width: scale,
      child: ClipOval(
        child: image,
      ),
    );
  }
}
