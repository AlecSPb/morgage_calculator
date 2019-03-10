import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/data/repositories/auth_repository.dart';
import 'package:road_keeper_mobile/injector.dart';
import 'package:road_keeper_mobile/utils/errors.dart';
import 'package:road_keeper_mobile/redux/app/app_actions.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/data/shared_pref_repository.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';

List<Middleware<AppState>> authMiddleware(
    {AuthRepository authRepository, SharedPrefRepository sharedPrefRepo}) {
  var authRepo = authRepository ?? Injector().authRepository;
  var sharedRepo = sharedPrefRepo ?? Injector().sharedPrefRepository;

  return [
    TypedMiddleware<AppState, TryLoginAction>(_tryLogin(authRepo, sharedRepo)),
  ];
}

Middleware<AppState> _tryLogin(
    AuthRepository repository, SharedPrefRepository sharedPrefs) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is TryLoginAction) {
      store.dispatch(StartLoadingAction());
      try {
        var token = await repository.obtainToken(action.login, action.password);
        await sharedPrefs.saveToken(token);
        next(AuthCompleteAction(true));
      } on ConnectException catch (e) {
        next(DomainExceptionAction(DialogShowExceptiton(e.toString())));
      } on ApiException catch (_) {
        next(DomainExceptionAction(
            DialogShowExceptiton("Ошибка аутентификации!!")));
      } finally {
        next(StopLoadingAction());
      }
    }
  };
}
