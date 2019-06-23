import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';

part 'payments_list_vm.g.dart';

abstract class PaymentsListVm
    implements Built<PaymentsListVm, PaymentsListVmBuilder> {
  PaymentsListVm._();

  BuiltList<MortGageCalcOutRow> get paymentsList;

  Function(int index, double additionalPaymentl) get setAddPaymentCallback;

  static PaymentsListVm fromStore(Store<AppState> store) {
    var addPaymentAction = (int index, double appPayment) {
      store.dispatch(RecalculateGraphAction(index, appPayment));
    };
    return PaymentsListVm((b) => b
      ..setAddPaymentCallback = addPaymentAction
      ..paymentsList =
          store.state.mortGageOutPut.graphState.paymentsList.toBuilder());
  }

  factory PaymentsListVm([updates(PaymentsListVmBuilder b)]) = _$PaymentsListVm;
}
