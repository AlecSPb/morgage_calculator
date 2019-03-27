import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';

List<Middleware<AppState>> createAppMiddleware() {
  return List()
    ..add(LoggingMiddleware.printer());
}




