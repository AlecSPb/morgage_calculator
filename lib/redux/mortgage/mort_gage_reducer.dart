import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_calc_out_row.dart';
import 'package:road_keeper_mobile/data/models/mort_gage_type.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_actions.dart';
import 'package:road_keeper_mobile/redux/mortgage/state/mort_gate_input_view_state.dart';
import 'package:road_keeper_mobile/utils/errors.dart';
import 'package:road_keeper_mobile/utils/format_utils.dart';

import 'state/mort_gage_output_state.dart';

Reducer<MortGageOutPutState> mortGageOutPutReducer = combineReducers(
    [TypedReducer<MortGageOutPutState, CalculateCreditAction>(_calculate)]);

Reducer<MortGageInputViewState> mortGageInputReducer = combineReducers(
    [TypedReducer<MortGageInputViewState, SaveInputDataAction>(_saveInput)]);

MortGageOutPutState _calculate(
    MortGageOutPutState state, CalculateCreditAction action) {
  //учитывать ли планируемый платеж
  var isPlannedPaymentCounted = action.estimatedPayment != null;
  var creditType = action.mortGageType ?? MortGageType.differentiated;
  var payments = (creditType == MortGageType.differentiated)
      ? _calculateDiffCreditPaymentsList(action)
      : _calculateAnnCreditPaymentsList(action);
  var totalPay = _calculateTotalPay(payments.toList());
  var calculatedCreditPaymentString = (isPlannedPaymentCounted)
      ? null
      : getcalculatedCreditPaymentString(creditType, payments.toList());
  var calculatorOutput = MortGageCalculatorOutputState((b) => b
    ..creditTerm = payments.length
    ..totalSum = totalPay
    ..overPay = totalPay - action.creditSum
    ..creditSum = action.creditSum
    ..calculatedCreditPayment = calculatedCreditPaymentString);
  var graphState = MortGageGraphOutPutState((b) => b
    ..paymentsList.replace(payments)
    ..totalSum = totalPay
    ..overPay = totalPay - action.creditSum
    ..creditSum = action.creditSum);
  return state.rebuild((b) => b
    ..graphState.replace(graphState)
    ..calculatorState.replace(calculatorOutput));
}

String getcalculatedCreditPaymentString(
    MortGageType mortGageType, List<MortGageCalcOutRow> payments) {
  String result;
  if (mortGageType == MortGageType.annuity) {
    if (payments.length == 0) return null;
    result = getBigDecimalString(payments.first?.totalPayment);
  } else {
    if (payments.length == 0) return null;
    result = getBigDecimalString(payments.first?.totalPayment);
    if (payments.length == 1) return result;
    result += "...";
    result += getBigDecimalString(payments.last.totalPayment);
  }
  return result;
}

MortGageInputViewState _saveInput(
    MortGageInputViewState state, SaveInputDataAction action) {
  return action.inputState;
}

///Расчет графика дифференцированного кредита
BuiltList<MortGageCalcOutRow> _calculateDiffCreditPaymentsList(
    CalculateCreditAction input) {
  var result = List<MortGageCalcOutRow>();
  var monthCounter = input.creditTerm;
  var currentCreditResidual = input.creditSum;
  var percents = input.creditPercents;
  var plannedPayment = input.estimatedPayment;
  while (currentCreditResidual > 0 && monthCounter > 0) {
    var paymentRow =
        _calculateDiffPaymentRow(currentCreditResidual, percents, monthCounter);
    //учет заданного "планируемого платежа"
    if (plannedPayment != null) {
      //если обязательный платеж больше планируемого -> exception
      if (paymentRow.totalPayment > plannedPayment)
        throw SnackBarShowException(
            "Планируемый платеж должен быть больше ${getBigDecimalString(paymentRow.totalPayment)}");
      var additionalPayment = plannedPayment - paymentRow.totalPayment;
      if (additionalPayment > paymentRow.creditResidual)
        additionalPayment = paymentRow.creditResidual;
      var creditResidual = paymentRow.creditResidual - additionalPayment;
      paymentRow = paymentRow.rebuild((b) => b
        ..additionalPayment = additionalPayment
        ..creditResidual = creditResidual);
    }
    result.add(paymentRow);
    monthCounter--;
    currentCreditResidual = paymentRow.creditResidual;
  }

  return BuiltList(result);
}

///Расчет графика аннуитетного кредита
BuiltList<MortGageCalcOutRow> _calculateAnnCreditPaymentsList(
    CalculateCreditAction input) {
  var result = List<MortGageCalcOutRow>();
  var monthCounter = input.creditTerm;
  var currentCreditResidual = input.creditSum;
  var percents = input.creditPercents;
  var plannedPayment = input.estimatedPayment;
  while (currentCreditResidual > 0 && monthCounter > 0) {
    var paymentRow =
        _calculateAnnPaymentRow(currentCreditResidual, percents, monthCounter);
    //учет заданного "планируемого платежа"
    if (plannedPayment != null) {
      //если обязательный платеж больше планируемого -> exception
      if (paymentRow.totalPayment > plannedPayment)
        throw SnackBarShowException(
            "Планируемый платеж должен быть больше ${getBigDecimalString(paymentRow.totalPayment)}");
      var additionalPayment = plannedPayment - paymentRow.totalPayment;
      if (additionalPayment > paymentRow.creditResidual)
        additionalPayment = paymentRow.creditResidual;
      var creditResidual = paymentRow.creditResidual - additionalPayment;
      paymentRow = paymentRow.rebuild((b) => b
        ..additionalPayment = additionalPayment
        ..creditResidual = creditResidual);
    }
    result.add(paymentRow);
    monthCounter--;
    currentCreditResidual = paymentRow.creditResidual;
  }
  return BuiltList(result);
}

double _calculateTotalPay(List<MortGageCalcOutRow> pays) {
  var result = 0.0;
  for (var pay in pays) {
    result += pay.totalPayment;
    result += pay.additionalPayment;
  }
  return result;
}

MortGageCalcOutRow _calculateDiffPaymentRow(
    double creditSum, double percents, int numberOfMonths,
    [double plannedPayment]) {
  //доля тела кредита
  var creditBodyPayment = creditSum / numberOfMonths;
  //доля процентов
  var percentPayment = creditSum * percents / 100 / 12;
  //cуммарный платеж
  var totalPayment = creditBodyPayment + percentPayment;
  //долг на конец месяца
  var creditResidual = creditSum - creditBodyPayment;
  return MortGageCalcOutRow((b) => b
    ..percentPayment = percentPayment
    ..mainPayment = creditBodyPayment
    ..totalPayment = totalPayment
    ..additionalPayment = 0.00
    ..creditResidual = creditResidual);
}

MortGageCalcOutRow _calculateAnnPaymentRow(
    double creditSum, double percents, int numberOfMonths) {
  //ежемесячная процентная ставка
  var i = percents * 0.01 / 12;
  //суммарный платеж
  var totalPayment = creditSum * (i + (i / (pow(1 + i, numberOfMonths) - 1)));
  //доля процентов
  var percentPayment = creditSum * i;
  //доля тела кредита
  var creditBodyPayment = totalPayment - percentPayment;
  //долг на конец месяца
  var creditResidual = creditSum - creditBodyPayment;
  return MortGageCalcOutRow((b) => b
    ..percentPayment = percentPayment
    ..mainPayment = creditBodyPayment
    ..totalPayment = totalPayment
    ..additionalPayment = 0.00
    ..creditResidual = creditResidual);
}
