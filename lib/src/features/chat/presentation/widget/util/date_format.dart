import 'package:intl/intl.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';

String formatChatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final difference = today.difference(aDate).inDays;

  if (difference == 0) {
    // Today: show time only
    return DateFormats.time12A.format(dateTime);
  } else if (difference == 1) {
    // Yesterday
    return "Yesterday";
  } else if (difference > 1 && difference < 7) {
    // Within last 7 days: show weekday name
    return DateFormat.EEEE().format(dateTime); // e.g., Monday, Tuesday
  } else {
    // Else show full date
    return DateFormats.ddMMM.format(dateTime); // e.g., 23 Nov
  }
}
