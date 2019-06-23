// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_output_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageOutPutState extends MortGageOutPutState {
  @override
  final MortGageCalculatorOutputState calculatorState;
  @override
  final MortGageGraphOutPutState graphState;

  factory _$MortGageOutPutState(
          [void Function(MortGageOutPutStateBuilder) updates]) =>
      (new MortGageOutPutStateBuilder()..update(updates)).build();

  _$MortGageOutPutState._({this.calculatorState, this.graphState}) : super._() {
    if (calculatorState == null) {
      throw new BuiltValueNullFieldError(
          'MortGageOutPutState', 'calculatorState');
    }
    if (graphState == null) {
      throw new BuiltValueNullFieldError('MortGageOutPutState', 'graphState');
    }
  }

  @override
  MortGageOutPutState rebuild(
          void Function(MortGageOutPutStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageOutPutStateBuilder toBuilder() =>
      new MortGageOutPutStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageOutPutState &&
        calculatorState == other.calculatorState &&
        graphState == other.graphState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, calculatorState.hashCode), graphState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageOutPutState')
          ..add('calculatorState', calculatorState)
          ..add('graphState', graphState))
        .toString();
  }
}

class MortGageOutPutStateBuilder
    implements Builder<MortGageOutPutState, MortGageOutPutStateBuilder> {
  _$MortGageOutPutState _$v;

  MortGageCalculatorOutputStateBuilder _calculatorState;
  MortGageCalculatorOutputStateBuilder get calculatorState =>
      _$this._calculatorState ??= new MortGageCalculatorOutputStateBuilder();
  set calculatorState(MortGageCalculatorOutputStateBuilder calculatorState) =>
      _$this._calculatorState = calculatorState;

  MortGageGraphOutPutStateBuilder _graphState;
  MortGageGraphOutPutStateBuilder get graphState =>
      _$this._graphState ??= new MortGageGraphOutPutStateBuilder();
  set graphState(MortGageGraphOutPutStateBuilder graphState) =>
      _$this._graphState = graphState;

  MortGageOutPutStateBuilder();

  MortGageOutPutStateBuilder get _$this {
    if (_$v != null) {
      _calculatorState = _$v.calculatorState?.toBuilder();
      _graphState = _$v.graphState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageOutPutState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageOutPutState;
  }

  @override
  void update(void Function(MortGageOutPutStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageOutPutState build() {
    _$MortGageOutPutState _$result;
    try {
      _$result = _$v ??
          new _$MortGageOutPutState._(
              calculatorState: calculatorState.build(),
              graphState: graphState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'calculatorState';
        calculatorState.build();
        _$failedField = 'graphState';
        graphState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MortGageOutPutState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MortGageCalculatorOutputState extends MortGageCalculatorOutputState {
  @override
  final double creditSum;
  @override
  final double totalSum;
  @override
  final double overPay;
  @override
  final int creditTerm;
  @override
  final String calculatedCreditPayment;

  factory _$MortGageCalculatorOutputState(
          [void Function(MortGageCalculatorOutputStateBuilder) updates]) =>
      (new MortGageCalculatorOutputStateBuilder()..update(updates)).build();

  _$MortGageCalculatorOutputState._(
      {this.creditSum,
      this.totalSum,
      this.overPay,
      this.creditTerm,
      this.calculatedCreditPayment})
      : super._() {
    if (creditSum == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalculatorOutputState', 'creditSum');
    }
    if (totalSum == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalculatorOutputState', 'totalSum');
    }
    if (overPay == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalculatorOutputState', 'overPay');
    }
    if (creditTerm == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalculatorOutputState', 'creditTerm');
    }
  }

  @override
  MortGageCalculatorOutputState rebuild(
          void Function(MortGageCalculatorOutputStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageCalculatorOutputStateBuilder toBuilder() =>
      new MortGageCalculatorOutputStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageCalculatorOutputState &&
        creditSum == other.creditSum &&
        totalSum == other.totalSum &&
        overPay == other.overPay &&
        creditTerm == other.creditTerm &&
        calculatedCreditPayment == other.calculatedCreditPayment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, creditSum.hashCode), totalSum.hashCode),
                overPay.hashCode),
            creditTerm.hashCode),
        calculatedCreditPayment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageCalculatorOutputState')
          ..add('creditSum', creditSum)
          ..add('totalSum', totalSum)
          ..add('overPay', overPay)
          ..add('creditTerm', creditTerm)
          ..add('calculatedCreditPayment', calculatedCreditPayment))
        .toString();
  }
}

class MortGageCalculatorOutputStateBuilder
    implements
        Builder<MortGageCalculatorOutputState,
            MortGageCalculatorOutputStateBuilder> {
  _$MortGageCalculatorOutputState _$v;

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

  String _calculatedCreditPayment;
  String get calculatedCreditPayment => _$this._calculatedCreditPayment;
  set calculatedCreditPayment(String calculatedCreditPayment) =>
      _$this._calculatedCreditPayment = calculatedCreditPayment;

  MortGageCalculatorOutputStateBuilder();

  MortGageCalculatorOutputStateBuilder get _$this {
    if (_$v != null) {
      _creditSum = _$v.creditSum;
      _totalSum = _$v.totalSum;
      _overPay = _$v.overPay;
      _creditTerm = _$v.creditTerm;
      _calculatedCreditPayment = _$v.calculatedCreditPayment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageCalculatorOutputState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageCalculatorOutputState;
  }

  @override
  void update(void Function(MortGageCalculatorOutputStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageCalculatorOutputState build() {
    final _$result = _$v ??
        new _$MortGageCalculatorOutputState._(
            creditSum: creditSum,
            totalSum: totalSum,
            overPay: overPay,
            creditTerm: creditTerm,
            calculatedCreditPayment: calculatedCreditPayment);
    replace(_$result);
    return _$result;
  }
}

class _$MortGageGraphOutPutState extends MortGageGraphOutPutState {
  @override
  final BuiltList<MortGageCalcOutRow> paymentsList;
  @override
  final double creditSum;
  @override
  final double totalSum;
  @override
  final double overPay;
  @override
  final MortGageType mortGageType;
  @override
  final double creditPercents;
  @override
  final int initCreditTerm;

  factory _$MortGageGraphOutPutState(
          [void Function(MortGageGraphOutPutStateBuilder) updates]) =>
      (new MortGageGraphOutPutStateBuilder()..update(updates)).build();

  _$MortGageGraphOutPutState._(
      {this.paymentsList,
      this.creditSum,
      this.totalSum,
      this.overPay,
      this.mortGageType,
      this.creditPercents,
      this.initCreditTerm})
      : super._() {
    if (paymentsList == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'paymentsList');
    }
    if (creditSum == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'creditSum');
    }
    if (totalSum == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'totalSum');
    }
    if (overPay == null) {
      throw new BuiltValueNullFieldError('MortGageGraphOutPutState', 'overPay');
    }
    if (mortGageType == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'mortGageType');
    }
    if (creditPercents == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'creditPercents');
    }
    if (initCreditTerm == null) {
      throw new BuiltValueNullFieldError(
          'MortGageGraphOutPutState', 'initCreditTerm');
    }
  }

  @override
  MortGageGraphOutPutState rebuild(
          void Function(MortGageGraphOutPutStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageGraphOutPutStateBuilder toBuilder() =>
      new MortGageGraphOutPutStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageGraphOutPutState &&
        paymentsList == other.paymentsList &&
        creditSum == other.creditSum &&
        totalSum == other.totalSum &&
        overPay == other.overPay &&
        mortGageType == other.mortGageType &&
        creditPercents == other.creditPercents &&
        initCreditTerm == other.initCreditTerm;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, paymentsList.hashCode), creditSum.hashCode),
                        totalSum.hashCode),
                    overPay.hashCode),
                mortGageType.hashCode),
            creditPercents.hashCode),
        initCreditTerm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageGraphOutPutState')
          ..add('paymentsList', paymentsList)
          ..add('creditSum', creditSum)
          ..add('totalSum', totalSum)
          ..add('overPay', overPay)
          ..add('mortGageType', mortGageType)
          ..add('creditPercents', creditPercents)
          ..add('initCreditTerm', initCreditTerm))
        .toString();
  }
}

class MortGageGraphOutPutStateBuilder
    implements
        Builder<MortGageGraphOutPutState, MortGageGraphOutPutStateBuilder> {
  _$MortGageGraphOutPutState _$v;

  ListBuilder<MortGageCalcOutRow> _paymentsList;
  ListBuilder<MortGageCalcOutRow> get paymentsList =>
      _$this._paymentsList ??= new ListBuilder<MortGageCalcOutRow>();
  set paymentsList(ListBuilder<MortGageCalcOutRow> paymentsList) =>
      _$this._paymentsList = paymentsList;

  double _creditSum;
  double get creditSum => _$this._creditSum;
  set creditSum(double creditSum) => _$this._creditSum = creditSum;

  double _totalSum;
  double get totalSum => _$this._totalSum;
  set totalSum(double totalSum) => _$this._totalSum = totalSum;

  double _overPay;
  double get overPay => _$this._overPay;
  set overPay(double overPay) => _$this._overPay = overPay;

  MortGageType _mortGageType;
  MortGageType get mortGageType => _$this._mortGageType;
  set mortGageType(MortGageType mortGageType) =>
      _$this._mortGageType = mortGageType;

  double _creditPercents;
  double get creditPercents => _$this._creditPercents;
  set creditPercents(double creditPercents) =>
      _$this._creditPercents = creditPercents;

  int _initCreditTerm;
  int get initCreditTerm => _$this._initCreditTerm;
  set initCreditTerm(int initCreditTerm) =>
      _$this._initCreditTerm = initCreditTerm;

  MortGageGraphOutPutStateBuilder();

  MortGageGraphOutPutStateBuilder get _$this {
    if (_$v != null) {
      _paymentsList = _$v.paymentsList?.toBuilder();
      _creditSum = _$v.creditSum;
      _totalSum = _$v.totalSum;
      _overPay = _$v.overPay;
      _mortGageType = _$v.mortGageType;
      _creditPercents = _$v.creditPercents;
      _initCreditTerm = _$v.initCreditTerm;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageGraphOutPutState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageGraphOutPutState;
  }

  @override
  void update(void Function(MortGageGraphOutPutStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageGraphOutPutState build() {
    _$MortGageGraphOutPutState _$result;
    try {
      _$result = _$v ??
          new _$MortGageGraphOutPutState._(
              paymentsList: paymentsList.build(),
              creditSum: creditSum,
              totalSum: totalSum,
              overPay: overPay,
              mortGageType: mortGageType,
              creditPercents: creditPercents,
              initCreditTerm: initCreditTerm);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'paymentsList';
        paymentsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MortGageGraphOutPutState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
