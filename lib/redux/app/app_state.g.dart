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
  final MortGageViewState mortGageViewState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.isLoading, this.domainEventException, this.mortGageViewState})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
    if (mortGageViewState == null) {
      throw new BuiltValueNullFieldError('AppState', 'mortGageViewState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        isLoading == other.isLoading &&
        domainEventException == other.domainEventException &&
        mortGageViewState == other.mortGageViewState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), domainEventException.hashCode),
        mortGageViewState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('domainEventException', domainEventException)
          ..add('mortGageViewState', mortGageViewState))
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

  MortGageViewStateBuilder _mortGageViewState;
  MortGageViewStateBuilder get mortGageViewState =>
      _$this._mortGageViewState ??= new MortGageViewStateBuilder();
  set mortGageViewState(MortGageViewStateBuilder mortGageViewState) =>
      _$this._mortGageViewState = mortGageViewState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _domainEventException = _$v.domainEventException;
      _mortGageViewState = _$v.mortGageViewState?.toBuilder();
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
  void update(void updates(AppStateBuilder b)) {
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
              mortGageViewState: mortGageViewState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'mortGageViewState';
        mortGageViewState.build();
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
