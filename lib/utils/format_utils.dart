
import 'package:intl/intl.dart';

var _numberFormat = NumberFormat("###,###,##0.00");

///format [num] to 1 000 000.00  [String]
String getBigDecimalString(num number){
 return _numberFormat.format(number);
}