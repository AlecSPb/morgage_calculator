// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gate_input_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageInputViewState extends MortGageInputViewState {
  @override
  final String creditSum;
  @override
  final String creditTerm;
  @override
  final String creditRate;
  @override
  final String plannedPayment;
  @override
  final MortGageType mortGageType;

  factory _$MortGageInputViewState(
          [void updates(MortGageInputViewStateBuilder b)]) =>
      (new MortGageInputViewStateBuilder()..update(updates)).build();

  _$MortGageInputViewState._(
      {this.creditSum,
      this.creditTerm,
      this.creditRate,
      this.plannedPayment,
      this.mortGageType})
      : super._() {
    if (creditSum == null) {
      throw new BuiltValueNullFieldError('MortGageInputViewState', 'creditSum');
    }
    if (creditTerm == null) {
      throw new BuiltValueNullFieldError(
          'MortGageInputViewState', 'creditTerm');
    }
    if (creditRate == null) {
      throw new BuiltValueNullFieldError(
          'MortGageInputViewState', 'creditRate');
    }
    if (plannedPayment == null) {
      throw new BuiltValueNullFieldError(
          'MortGageInputViewState', 'plannedPayment');
    }
  }

  @override
  MortGageInputViewState rebuild(
          void updates(MortGageInputViewStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageInputViewStateBuilder toBuilder() =>
      new MortGageInputViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageInputViewState &&
        creditSum == other.creditSum &&
        creditTerm == other.creditTerm &&
        creditRate == other.creditRate &&
        plannedPayment == other.plannedPayment &&
        mortGageType == other.mortGageType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, creditSum.hashCode), creditTerm.hashCode),
                creditRate.hashCode),
            plannedPayment.hashCode),
        mortGageType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageInputViewState')
          ..add('creditSum', creditSum)
          ..add('creditTerm', creditTerm)
          ..add('creditRate', creditRate)
          ..add('plannedPayment', plannedPayment)
          ..add('mortGageType', mortGageType))
        .toString();
  }
}

class MortGageInputViewStateBuilder
    implements Builder<MortGageInputViewState, MortGageInputViewStateBuilder> {
  _$MortGageInputViewState _$v;

  String _creditSum;
  String get creditSum => _$this._creditSum;
  set creditSum(String creditSum) => _$this._creditSum = creditSum;

  String _creditTerm;
  String get creditTerm => _$this._creditTerm;
  set creditTerm(String creditTerm) => _$this._creditTerm = creditTerm;

  String _creditRate;
  String get creditRate => _$this._creditRate;
  set creditRate(String creditRate) => _$this._creditRate = creditRate;

  String _plannedPayment;
  String get plannedPayment => _$this._plannedPayment;
  set plannedPayment(String plannedPayment) =>
      _$this._plannedPayment = plannedPayment;

  MortGageType _mortGageType;
  MortGageType get mortGageType => _$this._mortGageType;
  set mortGageType(MortGageType mortGageType) =>
      _$this._mortGageType = mortGageType;

  MortGageInputViewStateBuilder();

  MortGageInputViewStateBuilder get _$this {
    if (_$v != null) {
      _creditSum = _$v.creditSum;
      _creditTerm = _$v.creditTerm;
      _creditRate = _$v.creditRate;
      _plannedPayment = _$v.plannedPayment;
      _mortGageType = _$v.mortGageType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageInputViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageInputViewState;
  }

  @override
  void update(void updates(MortGageInputViewStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageInputViewState build() {
    final _$result = _$v ??
        new _$MortGageInputViewState._(
            creditSum: creditSum,
            creditTerm: creditTerm,
            creditRate: creditRate,
            plannedPayment: plannedPayment,
            mortGageType: mortGageType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
