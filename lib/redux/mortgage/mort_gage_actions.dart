import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';

import 'package:road_keeper_mobile/redux/mortgage/state/mort_gate_input_view_state.dart';

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

  @nullable
  double get estimatedPayment;

  @nullable
  MortGageType get mortGageType;

  factory CalculateCreditAction([updates(CalculateCreditActionBuilder b)]) =
      _$CalculateCreditAction;
}

class RecalculateGraphAction implements MortGageAction {
  final double additionalPayment;
  final int monthIndex;

  RecalculateGraphAction(this.monthIndex, this.additionalPayment);
}

class SaveInputDataAction implements MortGageAction {
  MortGageInputViewState inputState;

  SaveInputDataAction(this.inputState);
}
