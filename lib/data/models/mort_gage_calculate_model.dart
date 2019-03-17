import 'package:meta/meta.dart';

class MortGageCalculateInput {
  final double creditSum, creditPercents, estimatedPayment;
  final int creditTerm;
  MortGageCalculateInput(this.creditSum, this.creditTerm, this.creditPercents,
      this.estimatedPayment);
}

class MortGageCalculatorOutputRow {
  final double creditResidue;
  final double mainPayment;
  final double percentPayment;
  final double totalPayment;
  final double additionalPayment;
  MortGageCalculatorOutputRow(
      {@required this.creditResidue,
      @required this.mainPayment,
      @required this.percentPayment,
      @required this.totalPayment,
      this.additionalPayment = 0.0
      });
}
