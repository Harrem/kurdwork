import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  TimeText({Key? key, required this.releaseDate}) : super(key: key);
  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Text(calculateReleaseDate(releaseDate));
  }

  String calculateReleaseDate(rDate) {
    var measuredTime = (DateTime.now().difference(rDate));

    if (measuredTime.inHours < 1) {
      return "${measuredTime.inMinutes} دەقە ";
    }
    if (measuredTime.inHours < 24) {
      return "${measuredTime.inHours} کاتژمێر ";
    }
    if (measuredTime.inHours >= 24) {
      return "${measuredTime.inDays} ڕۆژ ";
    }
    return measuredTime.inHours.toString();
  }
}
