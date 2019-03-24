import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_view_state.dart';

Reducer<MortGageViewState> mortGageReducer = combineReducers(
    [TypedReducer<MortGageViewState, CalculateCreditAction>(_calculate)]);


MortGageViewState _calculate(MortGageViewState state, CalculateCreditAction action){
  var payments = _calculateCreditPaymentsList(action);
  var totalPay = _calculateTotalPay(payments.toList());
  return MortGageViewState((b) => b
    ..paymentsList.replace(payments)
    ..totalSum = totalPay
    ..overPay = totalPay - action.creditSum
    ..creditSum = action.creditSum);
}

BuiltList<MortGageCalcOutRow> _calculateCreditPaymentsList(
    CalculateCreditAction input) {
  var result = List<MortGageCalcOutRow>();
  var firstPayment = _calculatePayment(
      input.creditSum, input.creditPercents, input.creditTerm);
  var firstCreditPayment =
  _calculatePercentPayment(input.creditSum, input.creditPercents);
  var firstAdditionalPayment =
  (((input.estimatedPayment ?? 0.0) - firstPayment) > 0)
      ? (input.estimatedPayment - firstPayment)
      : 0.0;
  var firstRow = MortGageCalcOutRow((b) => b
    ..creditResidual = input.creditSum
    ..percentPayment = firstCreditPayment
    ..mainPayment = firstPayment - firstCreditPayment
    ..totalPayment = firstPayment
    ..additionalPayment = firstAdditionalPayment);

  var currentCreditResidual = input.creditSum;
  result.add(firstRow);

  while (currentCreditResidual > 0) {
    var prevRow = result.last;
    var nextCreditResidual = prevRow.creditResidual -
        (prevRow.mainPayment + prevRow.additionalPayment);
    currentCreditResidual = (nextCreditResidual < 0) ? 0 : nextCreditResidual;
    var nextCreditPayment = _calculatePayment(currentCreditResidual,
        input.creditPercents, input.creditTerm - result.length);
    var nextPercentsPayment =
    _calculatePercentPayment(currentCreditResidual, input.creditPercents);
    var nextAdditionalPayment =
        (input.estimatedPayment ?? 0) - nextCreditPayment;
    var additionalPayment = (nextAdditionalPayment > 0)
        ? ((currentCreditResidual == 0)
        ? (prevRow.creditResidual - nextCreditPayment)
        : nextAdditionalPayment)
        : 0.0;

    var nextRow = MortGageCalcOutRow((b) => b
      ..creditResidual = currentCreditResidual
      ..percentPayment = nextPercentsPayment
      ..mainPayment = nextCreditPayment - nextPercentsPayment
      ..totalPayment = nextCreditPayment
      ..additionalPayment = additionalPayment);
    result.add(nextRow);
  }

  return BuiltList(result);
}

double _calculateTotalPay(List<MortGageCalcOutRow> pays) {
  var result = 0.0;
  for (var pay in pays) {
    result += pay.totalPayment;
  }
  return result;
}

double _calculatePayment(
    double creditSum, double percents, int numberOfMonths) {
  return creditSum *
      ((percents * 0.01 / 12) /
          (1 - pow(1 + (percents * 0.01 / 12), -1 * numberOfMonths)));
}

double _calculatePercentPayment(creditSum, creditPercents) {
  return creditSum * creditPercents * 0.01 / 12;
}