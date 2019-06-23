import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';

part 'mort_gage_output_state.g.dart';

abstract class MortGageOutPutState
    implements Built<MortGageOutPutState, MortGageOutPutStateBuilder> {
  MortGageOutPutState._();

  MortGageCalculatorOutputState get calculatorState;

  MortGageGraphOutPutState get graphState;

  factory MortGageOutPutState([updates(MortGageOutPutStateBuilder b)]) =
      _$MortGageOutPutState;
}

abstract class MortGageCalculatorOutputState
    implements
        Built<MortGageCalculatorOutputState,
            MortGageCalculatorOutputStateBuilder> {
  MortGageCalculatorOutputState._();

  double get creditSum;

  double get totalSum;

  double get overPay;

  int get creditTerm;

  double get percentOverPay => overPay / totalSum * 100;

  ///расчетный ежемесячный взнос
  ///если при расчете был задан запланированный платеж
  ///равен [null].
  ///При расчете аннуитетного кредита - double
  ///При расчете дифференцированного кредита - строка вида
  ///[в начале периода:...
  ///[в конце периода:...]
  @nullable
  String get calculatedCreditPayment;

  factory MortGageCalculatorOutputState(
          [void Function(MortGageCalculatorOutputStateBuilder) updates]) =
      _$MortGageCalculatorOutputState;
}

abstract class MortGageGraphOutPutState
    implements
        Built<MortGageGraphOutPutState, MortGageGraphOutPutStateBuilder> {
  MortGageGraphOutPutState._();

  BuiltList<MortGageCalcOutRow> get paymentsList;

  double get creditSum;

  double get totalSum;

  double get overPay;

  MortGageType get mortGageType;

  double get creditPercents;

  int get initCreditTerm;

  double get percentOverPay => overPay / totalSum * 100;

  int get creditTerm => paymentsList.length;

  factory MortGageGraphOutPutState(
          [void Function(MortGageGraphOutPutStateBuilder) updates]) =
      _$MortGageGraphOutPutState;
}
