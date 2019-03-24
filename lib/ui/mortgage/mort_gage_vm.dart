import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';
part 'mort_gage_vm.g.dart';





abstract class MortGageVm implements Built<MortGageVm, MortGageVmBuilder> {
  MortGageVm._();
  MortGageViewState get mortGageViewState;
  Function(MortGageAction) get storeAction;

  static MortGageVm fromStore(Store<AppState> store){
    var stAction = (MortGageAction action){
      store.dispatch(action);};
    return MortGageVm((b)=>b
      ..storeAction = stAction
      ..mortGageViewState = store.state.mortGageViewState.toBuilder()
    );
  }

  factory MortGageVm([updates(MortGageVmBuilder b)]) = _$MortGageVm;
}
