// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_list_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentsListVm extends PaymentsListVm {
  @override
  final BuiltList<MortGageCalcOutRow> paymentsList;
  @override
  final Function(int index, double additionalPaymentl) setAddPaymentCallback;

  factory _$PaymentsListVm([void Function(PaymentsListVmBuilder) updates]) =>
      (new PaymentsListVmBuilder()..update(updates)).build();

  _$PaymentsListVm._({this.paymentsList, this.setAddPaymentCallback})
      : super._() {
    if (paymentsList == null) {
      throw new BuiltValueNullFieldError('PaymentsListVm', 'paymentsList');
    }
    if (setAddPaymentCallback == null) {
      throw new BuiltValueNullFieldError(
          'PaymentsListVm', 'setAddPaymentCallback');
    }
  }

  @override
  PaymentsListVm rebuild(void Function(PaymentsListVmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentsListVmBuilder toBuilder() =>
      new PaymentsListVmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is PaymentsListVm &&
        paymentsList == other.paymentsList &&
        setAddPaymentCallback == _$dynamicOther.setAddPaymentCallback;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, paymentsList.hashCode), setAddPaymentCallback.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentsListVm')
          ..add('paymentsList', paymentsList)
          ..add('setAddPaymentCallback', setAddPaymentCallback))
        .toString();
  }
}

class PaymentsListVmBuilder
    implements Builder<PaymentsListVm, PaymentsListVmBuilder> {
  _$PaymentsListVm _$v;

  ListBuilder<MortGageCalcOutRow> _paymentsList;
  ListBuilder<MortGageCalcOutRow> get paymentsList =>
      _$this._paymentsList ??= new ListBuilder<MortGageCalcOutRow>();
  set paymentsList(ListBuilder<MortGageCalcOutRow> paymentsList) =>
      _$this._paymentsList = paymentsList;

  Function(int index, double additionalPaymentl) _setAddPaymentCallback;
  Function(int index, double additionalPaymentl) get setAddPaymentCallback =>
      _$this._setAddPaymentCallback;
  set setAddPaymentCallback(
          Function(int index, double additionalPaymentl)
              setAddPaymentCallback) =>
      _$this._setAddPaymentCallback = setAddPaymentCallback;

  PaymentsListVmBuilder();

  PaymentsListVmBuilder get _$this {
    if (_$v != null) {
      _paymentsList = _$v.paymentsList?.toBuilder();
      _setAddPaymentCallback = _$v.setAddPaymentCallback;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsListVm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PaymentsListVm;
  }

  @override
  void update(void Function(PaymentsListVmBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentsListVm build() {
    _$PaymentsListVm _$result;
    try {
      _$result = _$v ??
          new _$PaymentsListVm._(
              paymentsList: paymentsList.build(),
              setAddPaymentCallback: setAddPaymentCallback);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'paymentsList';
        paymentsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PaymentsListVm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
