import 'dart:math';
import 'package:road_keeper_mobile/data/models/mort_gage_calculate_model.dart';

class MortGageCalculateBlock {
  List<MortGageCalculatorOutputRow> calculateCredit(
      MortGageCalculateInput input) {
    var result = List<MortGageCalculatorOutputRow>();
    var firstPayment = _calculatePayment(
        input.creditSum, input.creditPercents, input.creditTerm);
    var firstCreditPayment =
        _calculatePercentPayment(input.creditSum, input.creditPercents);
    var firstAdditionalPayment =
        (((input.estimatedPayment ?? 0.0) - firstPayment) > 0)
            ? (input.estimatedPayment - firstPayment)
            : 0.0;
    var firstRow = MortGageCalculatorOutputRow(
        creditResidue: input.creditSum,
        percentPayment: firstCreditPayment,
        mainPayment: firstPayment - firstCreditPayment,
        totalPayment: firstPayment,
        additionalPayment: firstAdditionalPayment);

    var currentCreditResidual = input.creditSum;
    result.add(firstRow);

    while (currentCreditResidual > 0) {
      var prevRow = result.last;
      var nextCreditResidual = prevRow.creditResidue -
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
              ? (prevRow.creditResidue - nextCreditPayment)
              : nextAdditionalPayment)
          : 0.0;

      var nextRow = MortGageCalculatorOutputRow(
          creditResidue: currentCreditResidual,
          percentPayment: nextPercentsPayment,
          mainPayment: nextCreditPayment - nextPercentsPayment,
          totalPayment: nextCreditPayment,
          additionalPayment: additionalPayment);
      result.add(nextRow);
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
}
