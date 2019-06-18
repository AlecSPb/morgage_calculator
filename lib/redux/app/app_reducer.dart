import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_actions.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/mortgage/mort_gage_reducer.dart';
import 'package:road_keeper_mobile/utils/event.dart';
import 'package:road_keeper_mobile/utils/errors.dart';

AppState appReducer(AppState state, dynamic action) {
  var resultState = state;
  try{
    resultState = state.rebuild((b) => b
      ..isLoading = _loadingReducer(b.isLoading, action)
      ..domainEventException = _exceptionReducers(b.domainEventException, action)
      ..mortGageViewState
          .replace(mortGageReducer(state.mortGageViewState, action))
      ..mortGageInputViewState
          .replace(mortGageInputReducer(state.mortGageInputViewState, action)));
  }on ShowException catch(e){
    resultState = state.rebuild((b) => b..domainEventException = Event(e));
  }
  return resultState;
}

final _loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StartLoadingAction>(_startLoad),
  TypedReducer<bool, StopLoadingAction>(_endLoad),
]);

bool _startLoad(bool state, action) => true;

bool _endLoad(bool state, action) => false;

final _exceptionReducers = combineReducers<Event<Exception>>([
  TypedReducer<Event<Exception>, DomainExceptionAction>(_handleDomainAction)
]);

Event<Exception> _handleDomainAction(
        Event<Exception> state, DomainExceptionAction action) =>
    Event(action.domainException);
