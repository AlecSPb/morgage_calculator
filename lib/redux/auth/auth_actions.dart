import 'dart:async';

import 'package:road_keeper_mobile/utils/completable_action.dart';

class TryLoginAction {
  final String login;
  final String password;
  TryLoginAction(this.login, this.password);
}

class AuthCompleteAction {
  final bool authState;
  AuthCompleteAction([this.authState = true]);
}

class LogOutAction extends CompletableAction {
  LogOutAction({Completer completer}) : super(completer: completer);
}
