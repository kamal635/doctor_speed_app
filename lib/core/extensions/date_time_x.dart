import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formatDate({String pattern = 'yyyy-MM-dd', String? locale}) {
    return DateFormat(pattern, locale).format(this);
  }

  String formatTime({String pattern = 'hh:mm a', String? locale}) {
    return DateFormat(pattern, locale).format(this);
  }

  String formatDateTime({
    String pattern = 'yyyy-MM-dd hh:mm a',
    String? locale,
  }) {
    return DateFormat(pattern, locale).format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
