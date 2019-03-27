
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';
import 'package:road_keeper_mobile/utils/event.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  bool get isLoading;
  @nullable
  Event<Exception> get domainEventException;

  MortGageViewState get mortGageViewState;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b)=>b
    ..isLoading = false
    ..mortGageViewState = MortGageViewState((b) => b
      ..paymentsList = ListBuilder<MortGageCalcOutRow>(List<MortGageCalcOutRow>(0))
      ..creditSum = 0.0
      ..totalSum = 0.0
      ..overPay = 0.0).toBuilder()
    ..update(updates));
}