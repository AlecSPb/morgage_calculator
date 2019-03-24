import 'package:built_value/built_value.dart';
part 'mort_gage_calc_out_row.g.dart';

abstract class MortGageCalcOutRow
    implements Built<MortGageCalcOutRow, MortGageCalcOutRowBuilder> {
  MortGageCalcOutRow._();

  double get creditResidual;
  double get mainPayment;
  double get percentPayment;
  double get totalPayment;
  double get additionalPayment;

  factory MortGageCalcOutRow([updates(MortGageCalcOutRowBuilder b)]) =
      _$MortGageCalcOutRow;
}
