import 'package:built_collection/built_collection.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_reducer.dart';
import 'package:road_keeper_mobile/redux/mortgage/state/mort_gage_output_state.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("calculator_test", () {
    var input = CalculateCreditAction((b) => b
      ..creditSum = 3450000
      ..creditTerm = 180
      ..creditPercents = 10.9
      ..estimatedPayment = 60000);
    var initState = MortGageOutPutState((b) => b
      ..calculatorState = MortGageCalculatorOutputState((b) => b
        ..creditSum = 0.0
        ..totalSum = 0.0
        ..overPay = 0.0).toBuilder()
      ..graphState = MortGageGraphOutPutState((b) => b
        ..paymentsList =
            ListBuilder<MortGageCalcOutRow>(List<MortGageCalcOutRow>(0))
        ..creditSum = 0.0
        ..totalSum = 0.0
        ..overPay = 0.0).toBuilder());
    var reducedState = mortGageOutPutReducer(initState, input);
    print(reducedState);
    print(reducedState.graphState.paymentsList.length);
  });
}
