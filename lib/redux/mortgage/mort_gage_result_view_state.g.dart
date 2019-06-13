// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_result_view_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageViewState extends MortGageViewState {
  @override
  final BuiltList<MortGageCalcOutRow> paymentsList;
  @override
  final double creditSum;
  @override
  final double totalSum;
  @override
  final double overPay;

  factory _$MortGageViewState([void updates(MortGageViewStateBuilder b)]) =>
      (new MortGageViewStateBuilder()..update(updates)).build();

  _$MortGageViewState._(
      {this.paymentsList, this.creditSum, this.totalSum, this.overPay})
      : super._() {
    if (paymentsList == null) {
      throw new BuiltValueNullFieldError('MortGageViewState', 'paymentsList');
    }
    if (creditSum == null) {
      throw new BuiltValueNullFieldError('MortGageViewState', 'creditSum');
    }
    if (totalSum == null) {
      throw new BuiltValueNullFieldError('MortGageViewState', 'totalSum');
    }
    if (overPay == null) {
      throw new BuiltValueNullFieldError('MortGageViewState', 'overPay');
    }
  }

  @override
  MortGageViewState rebuild(void updates(MortGageViewStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageViewStateBuilder toBuilder() =>
      new MortGageViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageViewState &&
        paymentsList == other.paymentsList &&
        creditSum == other.creditSum &&
        totalSum == other.totalSum &&
        overPay == other.overPay;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, paymentsList.hashCode), creditSum.hashCode),
            totalSum.hashCode),
        overPay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageViewState')
          ..add('paymentsList', paymentsList)
          ..add('creditSum', creditSum)
          ..add('totalSum', totalSum)
          ..add('overPay', overPay))
        .toString();
  }
}

class MortGageViewStateBuilder
    implements Builder<MortGageViewState, MortGageViewStateBuilder> {
  _$MortGageViewState _$v;

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

  MortGageViewStateBuilder();

  MortGageViewStateBuilder get _$this {
    if (_$v != null) {
      _paymentsList = _$v.paymentsList?.toBuilder();
      _creditSum = _$v.creditSum;
      _totalSum = _$v.totalSum;
      _overPay = _$v.overPay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageViewState;
  }

  @override
  void update(void updates(MortGageViewStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageViewState build() {
    _$MortGageViewState _$result;
    try {
      _$result = _$v ??
          new _$MortGageViewState._(
              paymentsList: paymentsList.build(),
              creditSum: creditSum,
              totalSum: totalSum,
              overPay: overPay);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'paymentsList';
        paymentsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MortGageViewState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
