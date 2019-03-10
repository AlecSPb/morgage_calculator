import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:road_keeper_mobile/main.dart';
import 'package:road_keeper_mobile/redux/app/app_actions.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/ui/auth/login_page_vm.dart';
import 'package:road_keeper_mobile/ui/photo_fix_contour/photo_page_map.dart';

class InitPage extends StatelessWidget {
  static final String route = "init_page";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      onInit:(store)=>store.dispatch(AppInitAction()) ,
      onWillChange: (isUserInited) {
        if (isUserInited == true) {
         // Navigator.of(context).pushReplacementNamed(HomePage.route);
          Navigator.of(context).pushReplacementNamed(PhotoMapPage.route);
        } else if (isUserInited == false) {
          Navigator.of(context).pushReplacementNamed(LoginScreenVM.route);
        }
      },
      converter: (store) => store.state.authState.requireAuth,
      builder: (BuildContext context, bool vm) {
        return Scaffold();
      },
    );
  }
}
