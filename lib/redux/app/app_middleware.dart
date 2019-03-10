import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:road_keeper_mobile/data/shared_pref_repository.dart';
import 'package:road_keeper_mobile/injector.dart';
import 'package:road_keeper_mobile/redux/app/app_actions.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';
import 'package:road_keeper_mobile/redux/auth/auth_midleware.dart';

List<Middleware<AppState>> createAppMiddleware() {
  return List()
    ..add(LoggingMiddleware.printer())
    ..addAll(appMiddleware())
    ..addAll(authMiddleware());
}

List<Middleware<AppState>> appMiddleware({SharedPrefRepository sharedPrefs}) {
  final sharedPrefRepo = sharedPrefs ?? Injector().sharedPrefRepository;
  return [
    TypedMiddleware<AppState, AppInitAction>(_initMiddleware(sharedPrefRepo)),
    TypedMiddleware<AppState, LogOutAction>(_logOutMiddleware(sharedPrefRepo)),
  ];
}

Middleware<AppState> _initMiddleware(SharedPrefRepository sharedPrefs) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    var currentToken = await sharedPrefs.getToken();
    next( AuthCompleteAction(currentToken != null));
  };
}

Middleware<AppState> _logOutMiddleware(SharedPrefRepository sharedPrefs) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if(action is LogOutAction){
      await sharedPrefs.cleanPrefs();
      next(action);
      action.completer.complete();
    }
  };
}
