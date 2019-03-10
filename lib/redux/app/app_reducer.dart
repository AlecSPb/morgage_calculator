import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_actions.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';
import 'package:road_keeper_mobile/redux/auth/auth_reducer.dart';
import 'package:road_keeper_mobile/utils/event.dart';

AppState appReducer(AppState state, dynamic action){
  if(action is LogOutAction){
    return AppState();
  }else{
    return  state.rebuild((b) => b
      ..isLoading = _loadingReducer(b.isLoading, action)
      ..domainEventException = _exceptionReducers(b.domainEventException, action)
      ..authState.replace(authReducer(state.authState, action))
    );
  }
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
