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

class CustomChip extends StatelessWidget {
  const CustomChip({Key? key, required this.label, this.padding})
      : super(key: key);
  final Widget label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: label,
      labelPadding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }
}
