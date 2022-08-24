import 'package:kurdwork/controller/time_span.dart';

class TimeText {
  static String calculateReleaseDate(rDate) {
    var measuredTime = (TimeSpan.fromNow(rDate));
    var str = "";

    if (measuredTime.inHours < 1) {
      str = "${measuredTime.inMinutes} minutes";
    } else if (measuredTime.inHours < 24) {
      str = "${measuredTime.inHours} hours ";
    } else if (measuredTime.inHours >= 24) {
      str = "${measuredTime.inDays} day ";
    } else if (measuredTime.inDays >= 30) {
      str = "${measuredTime.inDays / 30} month ";
    }
    return str;
  }
}
