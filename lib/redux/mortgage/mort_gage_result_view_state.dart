import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';

part 'mort_gage_result_view_state.g.dart';

abstract class MortGageViewState
    implements Built<MortGageViewState, MortGageViewStateBuilder> {
  MortGageViewState._();

  BuiltList<MortGageCalcOutRow> get paymentsList;
  double get creditSum;
  double get totalSum;
  double get overPay;

  factory MortGageViewState([updates(MortGageViewStateBuilder b)]) =
      _$MortGageViewState;
}
