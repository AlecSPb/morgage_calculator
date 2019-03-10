import 'dart:async';

class CompletableAction {
  final Completer completer;

  CompletableAction({Completer completer})
      : this.completer = completer ?? Completer();
}
