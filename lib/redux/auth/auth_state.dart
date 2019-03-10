
import 'package:built_value/built_value.dart';
part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {

  @nullable
  bool get requireAuth;

  AuthState._();
  factory AuthState([updates(AuthStateBuilder b)]) => _$AuthState((b)=>b
    ..update(updates));
}