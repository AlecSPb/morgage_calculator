
import 'package:built_value/built_value.dart';
import 'package:road_keeper_mobile/redux/auth/auth_state.dart';
import 'package:road_keeper_mobile/utils/event.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  bool get isLoading;
  @nullable
  Event<Exception> get domainEventException;

  AuthState get authState;

  AppState._();
  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b)=>b
    ..isLoading = false
    ..authState = AuthState().toBuilder()
    ..update(updates));
}