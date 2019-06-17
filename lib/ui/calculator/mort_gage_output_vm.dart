import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_result_view_state.dart';
import 'package:road_keeper_mobile/utils/format_utils.dart';

part 'mort_gage_output_vm.g.dart';

abstract class MortGageOutPutVm implements Built<MortGageOutPutVm, MortGageOutPutVmBuilder> {
  MortGageOutPutVm._();

  MortGageViewState get mortGageViewState;

  Function(MortGageAction) get storeAction;

  String get creditSum => _getDoubleDigitString(mortGageViewState.creditSum);

  String get totalSum => _getDoubleDigitString(mortGageViewState.totalSum);

  String get overPay => _getDoubleDigitString(mortGageViewState.overPay);

  String get creditMounthCount =>
      _getTimeLengthString(mortGageViewState.paymentsList.length);

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
    if(months > 0){
      yearsString += " и ";
    }
    return yearsString + monthsString;
  }

  static MortGageOutPutVm fromStore(Store<AppState> store) {
    var stAction = (MortGageAction action) {
      store.dispatch(action);
    };
    return MortGageOutPutVm((b) => b
      ..storeAction = stAction
      ..mortGageViewState = store.state.mortGageViewState.toBuilder());
  }

  factory MortGageOutPutVm([updates(MortGageOutPutVmBuilder b)]) = _$MortGageOutPutVm;
}
