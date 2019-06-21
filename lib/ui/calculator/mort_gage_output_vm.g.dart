// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_output_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageOutPutVm extends MortGageOutPutVm {
  @override
  final Function(MortGageAction) storeAction;
  @override
  final double creditSum;
  @override
  final double totalSum;
  @override
  final double overPay;
  @override
  final int creditTerm;
  @override
  final int percentOverPay;
  @override
  final String regularCreditPayment;

  factory _$MortGageOutPutVm(
          [void Function(MortGageOutPutVmBuilder) updates]) =>
      (new MortGageOutPutVmBuilder()..update(updates)).build();

  _$MortGageOutPutVm._(
      {this.storeAction,
      this.creditSum,
      this.totalSum,
      this.overPay,
      this.creditTerm,
      this.percentOverPay,
      this.regularCreditPayment})
      : super._() {
    if (storeAction == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'storeAction');
    }
    if (creditSum == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'creditSum');
    }
    if (totalSum == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'totalSum');
    }
    if (overPay == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'overPay');
    }
    if (creditTerm == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'creditTerm');
    }
    if (percentOverPay == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutVm', 'percentOverPay');
    }
  }

  @override
  MortGageOutPutVm rebuild(void Function(MortGageOutPutVmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageOutPutVmBuilder toBuilder() =>
      new MortGageOutPutVmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is MortGageOutPutVm &&
        storeAction == _$dynamicOther.storeAction &&
        creditSum == other.creditSum &&
        totalSum == other.totalSum &&
        overPay == other.overPay &&
        creditTerm == other.creditTerm &&
        percentOverPay == other.percentOverPay &&
        regularCreditPayment == other.regularCreditPayment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, storeAction.hashCode), creditSum.hashCode),
                        totalSum.hashCode),
                    overPay.hashCode),
                creditTerm.hashCode),
            percentOverPay.hashCode),
        regularCreditPayment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageOutPutVm')
          ..add('storeAction', storeAction)
          ..add('creditSum', creditSum)
          ..add('totalSum', totalSum)
          ..add('overPay', overPay)
          ..add('creditTerm', creditTerm)
          ..add('percentOverPay', percentOverPay)
          ..add('regularCreditPayment', regularCreditPayment))
        .toString();
  }
}

class MortGageOutPutVmBuilder
    implements Builder<MortGageOutPutVm, MortGageOutPutVmBuilder> {
  _$MortGageOutPutVm _$v;

  Function(MortGageAction) _storeAction;
  Function(MortGageAction) get storeAction => _$this._storeAction;
  set storeAction(Function(MortGageAction) storeAction) =>
      _$this._storeAction = storeAction;

  double _creditSum;
  double get creditSum => _$this._creditSum;
  set creditSum(double creditSum) => _$this._creditSum = creditSum;

  double _totalSum;
  double get totalSum => _$this._totalSum;
  set totalSum(double totalSum) => _$this._totalSum = totalSum;

  double _overPay;
  double get overPay => _$this._overPay;
  set overPay(double overPay) => _$this._overPay = overPay;

  int _creditTerm;
  int get creditTerm => _$this._creditTerm;
  set creditTerm(int creditTerm) => _$this._creditTerm = creditTerm;

  int _percentOverPay;
  int get percentOverPay => _$this._percentOverPay;
  set percentOverPay(int percentOverPay) =>
      _$this._percentOverPay = percentOverPay;

  String _regularCreditPayment;
  String get regularCreditPayment => _$this._regularCreditPayment;
  set regularCreditPayment(String regularCreditPayment) =>
      _$this._regularCreditPayment = regularCreditPayment;

  MortGageOutPutVmBuilder();

  MortGageOutPutVmBuilder get _$this {
    if (_$v != null) {
      _storeAction = _$v.storeAction;
      _creditSum = _$v.creditSum;
      _totalSum = _$v.totalSum;
      _overPay = _$v.overPay;
      _creditTerm = _$v.creditTerm;
      _percentOverPay = _$v.percentOverPay;
      _regularCreditPayment = _$v.regularCreditPayment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageOutPutVm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageOutPutVm;
  }

  @override
  void update(void Function(MortGageOutPutVmBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageOutPutVm build() {
    final _$result = _$v ??
        new _$MortGageOutPutVm._(
            storeAction: storeAction,
            creditSum: creditSum,
            totalSum: totalSum,
            overPay: overPay,
            creditTerm: creditTerm,
            percentOverPay: percentOverPay,
            regularCreditPayment: regularCreditPayment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
