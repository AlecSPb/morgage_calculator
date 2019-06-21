// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_actions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CalculateCreditAction extends CalculateCreditAction {
  @override
  final double creditSum;
  @override
  final double creditPercents;
  @override
  final int creditTerm;
  @override
  final double estimatedPayment;
  @override
  final MortGageType mortGageType;

  factory _$CalculateCreditAction(
          [void Function(CalculateCreditActionBuilder) updates]) =>
      (new CalculateCreditActionBuilder()..update(updates)).build();

  _$CalculateCreditAction._(
      {this.creditSum,
      this.creditPercents,
      this.creditTerm,
      this.estimatedPayment,
      this.mortGageType})
      : super._() {
    if (creditSum == null) {
      throw new BuiltValueNullFieldError('CalculateCreditAction', 'creditSum');
    }
    if (creditPercents == null) {
      throw new BuiltValueNullFieldError(
          'CalculateCreditAction', 'creditPercents');
    }
    if (creditTerm == null) {
      throw new BuiltValueNullFieldError('CalculateCreditAction', 'creditTerm');
    }
  }

  @override
  CalculateCreditAction rebuild(
          void Function(CalculateCreditActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalculateCreditActionBuilder toBuilder() =>
      new CalculateCreditActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalculateCreditAction &&
        creditSum == other.creditSum &&
        creditPercents == other.creditPercents &&
        creditTerm == other.creditTerm &&
        estimatedPayment == other.estimatedPayment &&
        mortGageType == other.mortGageType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, creditSum.hashCode), creditPercents.hashCode),
                creditTerm.hashCode),
            estimatedPayment.hashCode),
        mortGageType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CalculateCreditAction')
          ..add('creditSum', creditSum)
          ..add('creditPercents', creditPercents)
          ..add('creditTerm', creditTerm)
          ..add('estimatedPayment', estimatedPayment)
          ..add('mortGageType', mortGageType))
        .toString();
  }
}

class CalculateCreditActionBuilder
    implements Builder<CalculateCreditAction, CalculateCreditActionBuilder> {
  _$CalculateCreditAction _$v;

  double _creditSum;
  double get creditSum => _$this._creditSum;
  set creditSum(double creditSum) => _$this._creditSum = creditSum;

  double _creditPercents;
  double get creditPercents => _$this._creditPercents;
  set creditPercents(double creditPercents) =>
      _$this._creditPercents = creditPercents;

  int _creditTerm;
  int get creditTerm => _$this._creditTerm;
  set creditTerm(int creditTerm) => _$this._creditTerm = creditTerm;

  double _estimatedPayment;
  double get estimatedPayment => _$this._estimatedPayment;
  set estimatedPayment(double estimatedPayment) =>
      _$this._estimatedPayment = estimatedPayment;

  MortGageType _mortGageType;
  MortGageType get mortGageType => _$this._mortGageType;
  set mortGageType(MortGageType mortGageType) =>
      _$this._mortGageType = mortGageType;

  CalculateCreditActionBuilder();

  CalculateCreditActionBuilder get _$this {
    if (_$v != null) {
      _creditSum = _$v.creditSum;
      _creditPercents = _$v.creditPercents;
      _creditTerm = _$v.creditTerm;
      _estimatedPayment = _$v.estimatedPayment;
      _mortGageType = _$v.mortGageType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalculateCreditAction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CalculateCreditAction;
  }

  @override
  void update(void Function(CalculateCreditActionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CalculateCreditAction build() {
    final _$result = _$v ??
        new _$CalculateCreditAction._(
            creditSum: creditSum,
            creditPercents: creditPercents,
            creditTerm: creditTerm,
            estimatedPayment: estimatedPayment,
            mortGageType: mortGageType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
