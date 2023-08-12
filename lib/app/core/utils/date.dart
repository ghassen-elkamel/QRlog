import 'package:intl/intl.dart';

class DateFormatter {
  static String format(DateTime date) {
    final f = DateFormat('dd/MM/yyyy');
    return f.format(date);
  }

  static String formatDuration(Duration duration) {
    return "${duration.inMinutes}".padLeft(2, "0") +
        ":" +
        "${duration.inSeconds.remainder(60)}".padLeft(2, "0");
  }
}
