
import 'package:built_value/built_value.dart';

part 'mort_gage_actions.g.dart';

class MortGageAction{}

abstract class CalculateCreditAction
    implements Built<CalculateCreditAction, CalculateCreditActionBuilder>, MortGageAction {
  CalculateCreditAction._();

  double get creditSum;
  double get creditPercents;
  int get creditTerm;
  double get estimatedPayment;

  factory CalculateCreditAction(
      [updates(CalculateCreditActionBuilder b)]) = _$CalculateCreditAction;
}