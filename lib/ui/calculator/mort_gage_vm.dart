import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';
import 'package:road_keeper_mobile/utils/format_utils.dart';

part 'mort_gage_vm.g.dart';

abstract class MortGageVm implements Built<MortGageVm, MortGageVmBuilder> {
  MortGageVm._();

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
    var result = "";
    if (months == 1) {
      result = "1 месяц";
    } else if (months > 1 && months < 5) {
      result = "$months месяца";
    } else if (months > 4) {
      result = "$months месяцев";
    }
    if (years == 1) {
      result = "1 год и " + result;
    } else if (years > 1 && years < 5) {
      result = "$years года и " + result;
    } else if (years > 4) {
      result = "$years лет и " + result;
    }
    return result;
  }

  static MortGageVm fromStore(Store<AppState> store) {
    var stAction = (MortGageAction action) {
      store.dispatch(action);
    };
    return MortGageVm((b) => b
      ..storeAction = stAction
      ..mortGageViewState = store.state.mortGageViewState.toBuilder());
  }

  factory MortGageVm([updates(MortGageVmBuilder b)]) = _$MortGageVm;
}
