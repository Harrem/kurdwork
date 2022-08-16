import 'package:kurdwork/controller/time_span.dart';

class TimeText {
  static String calculateReleaseDate(rDate) {
    var measuredTime = (TimeSpan.fromNow(rDate));
    var str = "";

    if (measuredTime.inHours < 1) {
      str = "${measuredTime.inMinutes} دەقە ";
    } else if (measuredTime.inHours < 24) {
      str = "${measuredTime.inHours} کاتژمێر ";
    } else if (measuredTime.inHours >= 24) {
      str = "${measuredTime.inDays} ڕۆژ ";
    } else if (measuredTime.inDays >= 30) {
      str = "${measuredTime.inDays / 30} مانگ ";
    }
    return str;
  }
}
