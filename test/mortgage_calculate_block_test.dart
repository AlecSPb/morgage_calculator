import 'package:road_keeper_mobile/block/motgage_calculate/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("calculator_test", () {
    var input = CalculateCreditAction((b) => b
      ..creditSum = 3450000
      ..creditTerm = 180
      ..creditPercents = 10.9
      ..estimatedPayment = null);
    var block = MortGageCalculateBlock();
    var result = block.calculateCreditPaymentsList(input);
    for (var index = 0; index < result.length; index++) {
      var row = result[index];
      print(
          "$index   ${row.creditResidual}   ${row.totalPayment}  ${row.additionalPayment}");
    }
  });
}