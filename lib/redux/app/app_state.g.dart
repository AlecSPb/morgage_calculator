// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final Event<Exception> domainEventException;
  @override
  final MortGageOutPutState mortGageOutPut;
  @override
  final MortGageInputViewState mortGageInputViewState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.isLoading,
      this.domainEventException,
      this.mortGageOutPut,
      this.mortGageInputViewState})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (mortGageOutPut == null) {
      throw new BuiltValueNullFieldError('AppState', 'mortGageOutPut');
    }
    if (mortGageInputViewState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mortGageInputViewState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        isLoading == other.isLoading &&
        domainEventException == other.domainEventException &&
        mortGageOutPut == other.mortGageOutPut &&
        mortGageInputViewState == other.mortGageInputViewState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), domainEventException.hashCode),
            mortGageOutPut.hashCode),
        mortGageInputViewState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('domainEventException', domainEventException)
          ..add('mortGageOutPut', mortGageOutPut)
          ..add('mortGageInputViewState', mortGageInputViewState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  Event<Exception> _domainEventException;
  Event<Exception> get domainEventException => _$this._domainEventException;
  set domainEventException(Event<Exception> domainEventException) =>
      _$this._domainEventException = domainEventException;

  MortGageOutPutStateBuilder _mortGageOutPut;
  MortGageOutPutStateBuilder get mortGageOutPut =>
      _$this._mortGageOutPut ??= new MortGageOutPutStateBuilder();
  set mortGageOutPut(MortGageOutPutStateBuilder mortGageOutPut) =>
      _$this._mortGageOutPut = mortGageOutPut;

  MortGageInputViewStateBuilder _mortGageInputViewState;
  MortGageInputViewStateBuilder get mortGageInputViewState =>
      _$this._mortGageInputViewState ??= new MortGageInputViewStateBuilder();
  set mortGageInputViewState(
          MortGageInputViewStateBuilder mortGageInputViewState) =>
      _$this._mortGageInputViewState = mortGageInputViewState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _domainEventException = _$v.domainEventException;
      _mortGageOutPut = _$v.mortGageOutPut?.toBuilder();
      _mortGageInputViewState = _$v.mortGageInputViewState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: isLoading,
              domainEventException: domainEventException,
              mortGageOutPut: mortGageOutPut.build(),
              mortGageInputViewState: mortGageInputViewState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mortGageOutPut';
        mortGageOutPut.build();
        _$failedField = 'mortGageInputViewState';
        mortGageInputViewState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
