import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/utils/format_utils.dart';

part 'mort_gage_output_vm.g.dart';

abstract class MortGageOutPutVm
    implements Built<MortGageOutPutVm, MortGageOutPutVmBuilder> {
  MortGageOutPutVm._();

  Function(MortGageAction) get storeAction;

  double get creditSum;

  double get totalSum;

  double get overPay;

  int get creditTerm;

  int get percentOverPay;

  @nullable
  String get regularCreditPayment;

  String get creditSumString => _getDoubleDigitString(creditSum);

  String get totalSumString => _getDoubleDigitString(totalSum);

  String get overPayString => _getDoubleDigitString(overPay);

  String get creditMounthCount => _getTimeLengthString(creditTerm);

  String _getDoubleDigitString(double number) {
    if (number == null || number == 0.0 || !(number is double)) return "_";
    return getBigDecimalString(number);
  }

  String _getTimeLengthString(int numberOfMonths) {
    if (numberOfMonths == null || numberOfMonths == 0) return "_";
    var years = numberOfMonths ~/ 12;
    var months = numberOfMonths - (years * 12);
    var monthsString = "";
    if (months == 1) {
      monthsString = "1 месяц";
    } else if (months > 1 && months < 5) {
      monthsString = "$months месяца";
    } else if (months > 4) {
      monthsString = "$months месяцев";
    }
    var yearsString = "";
    if (years == 1) {
      yearsString = "1 год";
    } else if (years > 1 && years < 5) {
      yearsString = "$years года";
    } else if (years > 4) {
      yearsString = "$years лет";
    }
    if (months > 0) {
      yearsString += " и ";
    }
    return yearsString + monthsString;
  }

  static MortGageOutPutVm fromCalculatorOutput(Store<AppState> store) {
    var stAction = (MortGageAction action) {
      store.dispatch(action);
    };
    var calcOutPut = store.state.mortGageOutPut.calculatorState;
    return MortGageOutPutVm((b) => b
      ..regularCreditPayment = calcOutPut.calculatedCreditPayment
      ..storeAction = stAction
      ..creditTerm = calcOutPut.creditTerm
      ..creditSum = calcOutPut.creditSum
      ..totalSum = calcOutPut.totalSum
      ..overPay = calcOutPut.overPay
      ..percentOverPay = (!calcOutPut.percentOverPay.isNaN)
          ? calcOutPut.percentOverPay.round()
          : 0);
  }

  static MortGageOutPutVm fromGraphOutput(Store<AppState> store) {
    var stAction = (MortGageAction action) {
      store.dispatch(action);
    };
    var graphOutput = store.state.mortGageOutPut.graphState;
    return MortGageOutPutVm((b) => b
      ..storeAction = stAction
      ..creditTerm = graphOutput.creditTerm
      ..creditSum = graphOutput.creditSum
      ..totalSum = graphOutput.totalSum
      ..overPay = graphOutput.overPay
      ..percentOverPay = graphOutput.percentOverPay.round());
  }

  factory MortGageOutPutVm([updates(MortGageOutPutVmBuilder b)]) =
      _$MortGageOutPutVm;
}
