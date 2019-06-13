// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_input_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageInputVm extends MortGageInputVm {
  @override
  final MortGageInputViewState mortGageInputViewState;
  @override
  final Function(MortGageAction) storeAction;

  factory _$MortGageInputVm([void updates(MortGageInputVmBuilder b)]) =>
      (new MortGageInputVmBuilder()..update(updates)).build();

  _$MortGageInputVm._({this.mortGageInputViewState, this.storeAction})
      : super._() {
    if (mortGageInputViewState == null) {
      throw new BuiltValueNullFieldError(
          'MortGageInputVm', 'mortGageInputViewState');
    }
    if (storeAction == null) {
      throw new BuiltValueNullFieldError('MortGageInputVm', 'storeAction');
    }
  }

  @override
  MortGageInputVm rebuild(void updates(MortGageInputVmBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageInputVmBuilder toBuilder() =>
      new MortGageInputVmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is MortGageInputVm &&
        mortGageInputViewState == other.mortGageInputViewState &&
        storeAction == _$dynamicOther.storeAction;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, mortGageInputViewState.hashCode), storeAction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageInputVm')
          ..add('mortGageInputViewState', mortGageInputViewState)
          ..add('storeAction', storeAction))
        .toString();
  }
}

class MortGageInputVmBuilder
    implements Builder<MortGageInputVm, MortGageInputVmBuilder> {
  _$MortGageInputVm _$v;

  MortGageInputViewStateBuilder _mortGageInputViewState;
  MortGageInputViewStateBuilder get mortGageInputViewState =>
      _$this._mortGageInputViewState ??= new MortGageInputViewStateBuilder();
  set mortGageInputViewState(
          MortGageInputViewStateBuilder mortGageInputViewState) =>
      _$this._mortGageInputViewState = mortGageInputViewState;

  Function(MortGageAction) _storeAction;
  Function(MortGageAction) get storeAction => _$this._storeAction;
  set storeAction(Function(MortGageAction) storeAction) =>
      _$this._storeAction = storeAction;

  MortGageInputVmBuilder();

  MortGageInputVmBuilder get _$this {
    if (_$v != null) {
      _mortGageInputViewState = _$v.mortGageInputViewState?.toBuilder();
      _storeAction = _$v.storeAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageInputVm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageInputVm;
  }

  @override
  void update(void updates(MortGageInputVmBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageInputVm build() {
    _$MortGageInputVm _$result;
    try {
      _$result = _$v ??
          new _$MortGageInputVm._(
              mortGageInputViewState: mortGageInputViewState.build(),
              storeAction: storeAction);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mortGageInputViewState';
        mortGageInputViewState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MortGageInputVm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
