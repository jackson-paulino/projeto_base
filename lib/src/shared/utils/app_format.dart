import 'package:intl/intl.dart';

class AppFormat {
  static var money = NumberFormat.currency(locale: 'pt', decimalDigits: 2, symbol: 'R\$');
  static var quantity = NumberFormat.decimalPattern('pt');
  static var dateTime = DateFormat('dd/MM/yyyy - HH:mm');
  static var date = DateFormat('dd/MM/yyyy');
}
