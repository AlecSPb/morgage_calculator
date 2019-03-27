import 'package:built_value/built_value.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';
part 'mort_gage_vm.g.dart';

var _numberFormat = NumberFormat("0.00");

abstract class MortGageVm implements Built<MortGageVm, MortGageVmBuilder> {
  MortGageVm._();
  MortGageViewState get mortGageViewState;
  Function(MortGageAction) get storeAction;

  String get creditSum => _getDoubleDigitString(mortGageViewState.creditSum);
  String get totalSum => _getDoubleDigitString(mortGageViewState.totalSum);
  String get overPay => _getDoubleDigitString(mortGageViewState.overPay);
  String get creditMounthCount =>
      _getIntDigitString(mortGageViewState.paymentsList.length);

  String _getDoubleDigitString(double number) {
    if (number == null || number == 0.0 || !(number is double)) return "_";
    return _numberFormat.format(number);
  }

  String _getIntDigitString(int number) {
    if (number == null || number == 0) return "_";
    return number.toString();
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
