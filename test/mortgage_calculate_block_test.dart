

import 'package:road_keeper_mobile/block/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calculate_model.dart';
import 'package:test_api/test_api.dart';

void main(){
  test("calculator_test",(){
    var input = MortGageCalculateInput(3450000, 180, 10.9, null);
    var block = MortGageCalculateBlock();
    var result = block.calculateCredit(input);
    for(var index = 0; index < result.length; index++){
      var row = result[index];
      print("$index   ${row.creditResidue}   ${row.totalPayment}  ${row.additionalPayment}");
    }
  });
}