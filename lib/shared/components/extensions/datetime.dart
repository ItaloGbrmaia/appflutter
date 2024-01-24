import 'package:intl/intl.dart';

extension DateTimeExtenstions on DateTime {
  String stringFormat([String format = DateFormat.YEAR_MONTH_DAY]) {
    return DateFormat(format, 'pt_BR').format(this);
  }
}
