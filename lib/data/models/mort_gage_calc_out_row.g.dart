// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_calc_out_row.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageCalcOutRow extends MortGageCalcOutRow {
  @override
  final double creditResidual;
  @override
  final double mainPayment;
  @override
  final double percentPayment;
  @override
  final double totalPayment;
  @override
  final double additionalPayment;

  factory _$MortGageCalcOutRow(
          [void Function(MortGageCalcOutRowBuilder) updates]) =>
      (new MortGageCalcOutRowBuilder()..update(updates)).build();

  _$MortGageCalcOutRow._(
      {this.creditResidual,
      this.mainPayment,
      this.percentPayment,
      this.totalPayment,
      this.additionalPayment})
      : super._() {
    if (creditResidual == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalcOutRow', 'creditResidual');
    }
    if (mainPayment == null) {
      throw new BuiltValueNullFieldError('MortGageCalcOutRow', 'mainPayment');
    }
    if (percentPayment == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalcOutRow', 'percentPayment');
    }
    if (totalPayment == null) {
      throw new BuiltValueNullFieldError('MortGageCalcOutRow', 'totalPayment');
    }
    if (additionalPayment == null) {
      throw new BuiltValueNullFieldError(
          'MortGageCalcOutRow', 'additionalPayment');
    }
  }

  @override
  MortGageCalcOutRow rebuild(
          void Function(MortGageCalcOutRowBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageCalcOutRowBuilder toBuilder() =>
      new MortGageCalcOutRowBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MortGageCalcOutRow &&
        creditResidual == other.creditResidual &&
        mainPayment == other.mainPayment &&
        percentPayment == other.percentPayment &&
        totalPayment == other.totalPayment &&
        additionalPayment == other.additionalPayment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, creditResidual.hashCode), mainPayment.hashCode),
                percentPayment.hashCode),
            totalPayment.hashCode),
        additionalPayment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageCalcOutRow')
          ..add('creditResidual', creditResidual)
          ..add('mainPayment', mainPayment)
          ..add('percentPayment', percentPayment)
          ..add('totalPayment', totalPayment)
          ..add('additionalPayment', additionalPayment))
        .toString();
  }
}

class MortGageCalcOutRowBuilder
    implements Builder<MortGageCalcOutRow, MortGageCalcOutRowBuilder> {
  _$MortGageCalcOutRow _$v;

  double _creditResidual;
  double get creditResidual => _$this._creditResidual;
  set creditResidual(double creditResidual) =>
      _$this._creditResidual = creditResidual;

  double _mainPayment;
  double get mainPayment => _$this._mainPayment;
  set mainPayment(double mainPayment) => _$this._mainPayment = mainPayment;

  double _percentPayment;
  double get percentPayment => _$this._percentPayment;
  set percentPayment(double percentPayment) =>
      _$this._percentPayment = percentPayment;

  double _totalPayment;
  double get totalPayment => _$this._totalPayment;
  set totalPayment(double totalPayment) => _$this._totalPayment = totalPayment;

  double _additionalPayment;
  double get additionalPayment => _$this._additionalPayment;
  set additionalPayment(double additionalPayment) =>
      _$this._additionalPayment = additionalPayment;

  MortGageCalcOutRowBuilder();

  MortGageCalcOutRowBuilder get _$this {
    if (_$v != null) {
      _creditResidual = _$v.creditResidual;
      _mainPayment = _$v.mainPayment;
      _percentPayment = _$v.percentPayment;
      _totalPayment = _$v.totalPayment;
      _additionalPayment = _$v.additionalPayment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageCalcOutRow other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageCalcOutRow;
  }

  @override
  void update(void Function(MortGageCalcOutRowBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageCalcOutRow build() {
    final _$result = _$v ??
        new _$MortGageCalcOutRow._(
            creditResidual: creditResidual,
            mainPayment: mainPayment,
            percentPayment: percentPayment,
            totalPayment: totalPayment,
            additionalPayment: additionalPayment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
