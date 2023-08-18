import 'package:intl/intl.dart';

class Utils {
  static reportTimeFormat(String? time) {
    var samTime = DateTime.parse(time!);
    var dateUtc = samTime.toLocal();

    var dateLocal = dateUtc.toUtc();

    String formattedTime = DateFormat('hh:mm a').format(dateLocal);

    return formattedTime;
  }
}