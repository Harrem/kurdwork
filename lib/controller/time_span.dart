///TimeSpan represents a time interval that is difference between two times
/// measured in number of days, hours, minutes, and seconds.
class TimeSpan {
  ///calculates difference between now and specified datetime
  ///return calculated Duration
  static Duration fromNow(DateTime dateTime) {
    Duration duration = DateTime.now().difference(dateTime);
    return duration;
  }
}
