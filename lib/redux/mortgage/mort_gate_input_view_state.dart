import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';

part 'mort_gate_input_view_state.g.dart';

abstract class MortGageInputViewState
    implements Built<MortGageInputViewState, MortGageInputViewStateBuilder> {
  String get creditSum;

  String get creditTerm;

  String get creditRate;

  String get plannedPayment;

  @nullable
  MortGageType get mortGageType;

  MortGageInputViewState._();

  factory MortGageInputViewState([updates(MortGageInputViewStateBuilder b)]) =
      _$MortGageInputViewState;
}
