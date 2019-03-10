import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/main.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';
import 'package:road_keeper_mobile/ui/auth/login_page.dart';
import 'package:vector_math/hash.dart';


class LoginScreenVM extends StatelessWidget {

  static final String route = "login_screen";

  LoginScreenVM({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        onWillChange: (viewModel) {
          if (viewModel.authStatus) {
            ///TODO insert your 'homePage' route.
            Navigator.of(context).pushReplacementNamed(HomePage.route);
          }
        },
        converter: _ViewModel._fromStore,
        builder: (BuildContext context, _ViewModel viewModel) {
          return LoginScreen(
            tryLogin: viewModel.tryLoginCallback,
          );
        });
  }
}


class _ViewModel {
  final bool authStatus;
  final TryLoginCallback tryLoginCallback;
  _ViewModel(this.authStatus, this.tryLoginCallback);

  static _ViewModel _fromStore(Store<AppState> store) {
    var tryLogingCallback =
        (login, password) => store.dispatch(TryLoginAction(login, password));

    return _ViewModel(store.state.authState.requireAuth, tryLogingCallback);
  }

  @override
  bool operator ==(other)=>(other is _ViewModel && other.hashCode == this.hashCode);

  @override
  int get hashCode => hashObjects([authStatus]);

}
