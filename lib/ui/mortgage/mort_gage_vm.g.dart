// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mort_gage_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MortGageVm extends MortGageVm {
  @override
  final MortGageViewState mortGageViewState;
  @override
  final Function(MortGageAction) storeAction;

  factory _$MortGageVm([void updates(MortGageVmBuilder b)]) =>
      (new MortGageVmBuilder()..update(updates)).build();

  _$MortGageVm._({this.mortGageViewState, this.storeAction}) : super._() {
    if (mortGageViewState == null) {
      throw new BuiltValueNullFieldError('MortGageVm', 'mortGageViewState');
    }
    if (storeAction == null) {
      throw new BuiltValueNullFieldError('MortGageVm', 'storeAction');
    }
  }

  @override
  MortGageVm rebuild(void updates(MortGageVmBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MortGageVmBuilder toBuilder() => new MortGageVmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final _$dynamicOther = other as dynamic;
    return other is MortGageVm &&
        mortGageViewState == other.mortGageViewState &&
        storeAction == _$dynamicOther.storeAction;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mortGageViewState.hashCode), storeAction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MortGageVm')
          ..add('mortGageViewState', mortGageViewState)
          ..add('storeAction', storeAction))
        .toString();
  }
}

class MortGageVmBuilder implements Builder<MortGageVm, MortGageVmBuilder> {
  _$MortGageVm _$v;

  MortGageViewStateBuilder _mortGageViewState;
  MortGageViewStateBuilder get mortGageViewState =>
      _$this._mortGageViewState ??= new MortGageViewStateBuilder();
  set mortGageViewState(MortGageViewStateBuilder mortGageViewState) =>
      _$this._mortGageViewState = mortGageViewState;

  Function(MortGageAction) _storeAction;
  Function(MortGageAction) get storeAction => _$this._storeAction;
  set storeAction(Function(MortGageAction) storeAction) =>
      _$this._storeAction = storeAction;

  MortGageVmBuilder();

  MortGageVmBuilder get _$this {
    if (_$v != null) {
      _mortGageViewState = _$v.mortGageViewState?.toBuilder();
      _storeAction = _$v.storeAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MortGageVm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MortGageVm;
  }

  @override
  void update(void updates(MortGageVmBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MortGageVm build() {
    _$MortGageVm _$result;
    try {
      _$result = _$v ??
          new _$MortGageVm._(
              mortGageViewState: mortGageViewState.build(),
              storeAction: storeAction);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mortGageViewState';
        mortGageViewState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MortGageVm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
