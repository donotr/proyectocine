import 'package:intl/intl.dart';
//*formato de decimales
class HumanFormats{
  static String number (double number){
    final formattedNumber = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '',locale: 'en',).format(number);
    return formattedNumber;
  }
}