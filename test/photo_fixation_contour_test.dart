import 'package:intl/intl.dart';
import 'package:test_api/test_api.dart';

void main() {


  test("graphQLclientTest",(){
    var _numberFormat = NumberFormat("###,###,##0.00");

    var number = 4827540.28;
    print(_numberFormat.format(number).replaceAll(",", " "));

  });
}
