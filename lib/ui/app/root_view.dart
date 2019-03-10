import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/ui/app/loading_indicator_hud.dart';
import 'package:road_keeper_mobile/utils/errors.dart';
import 'package:road_keeper_mobile/utils/event.dart';
import 'package:road_keeper_mobile/utils/ui_utils.dart';
import 'package:vector_math/hash.dart';

class RootContainer extends StatelessWidget {
  final Widget child;

  RootContainer({Key key, @required this.child}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onWillChange: (vm)=>vm.eventHandler(context),
      builder: (context, vm)=>LoadingIndicatorHUD(
        isLoading: vm.isLoading,
        child: child,
      ),
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final Event<Exception> domainExceptionEvent;
  _ViewModel(this.isLoading, this.domainExceptionEvent);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(store.state.isLoading, store.state.domainEventException);
  }


  eventHandler(BuildContext context) {
    var error = domainExceptionEvent?.dataIfNotHandled;
    if (error != null && error is DialogShowExceptiton) {
      showDialogSingleButton(
        context,
        "Ошибка!!!",
        error.message,
      );
    }
    if (error is SnackBarShowException) {
      print(error);
      /*ScaffoldState scaffold = scaffState ?? Scaffold.of(context);
      scaffold.showSnackBar(SnackBar(
          duration: Duration(milliseconds: 1000),
          content: Text(
            error.message,
            style: TextStyle(color: Colors.red),
          )));*/
    }
  }

  @override
  bool operator ==(other) =>
      (other is _ViewModel) &&
      (other.isLoading == isLoading) &&
      (other.domainExceptionEvent == domainExceptionEvent);

  @override
  int get hashCode => hashObjects([isLoading, domainExceptionEvent]);
}
