import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gate_input_view_state.dart';

part 'mort_gage_input_vm.g.dart';

abstract class MortGageInputVm
    implements Built<MortGageInputVm, MortGageInputVmBuilder> {
  MortGageInputVm._();

  MortGageInputViewState get mortGageInputViewState;

  Function(MortGageAction) get storeAction;

  static MortGageInputVm fromStore(Store<AppState> store) {
    var svAction = (MortGageAction action) {
      store.dispatch(action);
    };
    return MortGageInputVm((b) => b
      ..storeAction = svAction
      ..mortGageInputViewState =
          store.state.mortGageInputViewState.toBuilder());
  }

  factory MortGageInputVm([updates(MortGageInputVmBuilder b)]) =
      _$MortGageInputVm;
}
