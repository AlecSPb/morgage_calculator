import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';

import 'mort_gate_input_view_state.dart';

part 'mort_gage_actions.g.dart';

class MortGageAction {}

abstract class CalculateCreditAction
    implements
        Built<CalculateCreditAction, CalculateCreditActionBuilder>,
        MortGageAction {
  CalculateCreditAction._();

  double get creditSum;

  double get creditPercents;

  int get creditTerm;

  double get estimatedPayment;

  @nullable
  MortGageType get mortGageType;

  factory CalculateCreditAction([updates(CalculateCreditActionBuilder b)]) =
      _$CalculateCreditAction;
}

class SaveInputDataAction implements MortGageAction {
  MortGageInputViewState inputState;

  SaveInputDataAction(this.inputState);
}
