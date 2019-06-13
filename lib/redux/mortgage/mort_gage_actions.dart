import 'package:built_value/built_value.dart';

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

  factory CalculateCreditAction([updates(CalculateCreditActionBuilder b)]) =
      _$CalculateCreditAction;
}

class SaveInputDataAction implements MortGageAction {
  MortGageInputViewState inputState;

  SaveInputDataAction(this.inputState);
}
