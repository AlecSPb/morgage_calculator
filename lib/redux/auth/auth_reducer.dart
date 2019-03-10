import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';

import 'package:road_keeper_mobile/redux/auth/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, AuthCompleteAction>(_init),
]);

AuthState _init(AuthState state, AuthCompleteAction action){
  return state.rebuild((b)=>b..requireAuth = action.authState);
}