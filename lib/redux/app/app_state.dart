import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';
import 'package:road_keeper_mobile/redux/mortgage/state/mort_gage_output_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/state/mort_gate_input_view_state.dart';
import 'package:road_keeper_mobile/utils/event.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;

  @nullable
  Event<Exception> get domainEventException;

  MortGageOutPutState get mortGageOutPut;

  MortGageInputViewState get mortGageInputViewState;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b) => b
    ..isLoading = false
    ..mortGageOutPut = (MortGageOutPutStateBuilder()
      ..update((b) => b
        ..calculatorState = MortGageCalculatorOutputState((b) => b
          ..creditTerm = 0
          ..creditSum = 0.0
          ..totalSum = 0.0
          ..overPay = 0.0).toBuilder()
        ..graphState = MortGageGraphOutPutState((b) => b
          ..creditPercents = 0
          ..initCreditTerm = 0
          ..mortGageType = MortGageType.annuity
          ..paymentsList =
              ListBuilder<MortGageCalcOutRow>(List<MortGageCalcOutRow>(0))
          ..creditSum = 0.0
          ..totalSum = 0.0
          ..overPay = 0.0).toBuilder()))
    ..mortGageInputViewState = MortGageInputViewState((b) => b
      ..creditRate = ""
      ..creditSum = ""
      ..creditTerm = ""
      ..plannedPayment = ""
      ..plannedPaymentCheck = false
      ..mortGageType = MortGageType.annuity).toBuilder()
    ..update(updates));
}
