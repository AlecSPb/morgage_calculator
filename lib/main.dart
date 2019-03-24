import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/block/motgage_calculate/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/redux/app/app_middleware.dart';
import 'package:road_keeper_mobile/redux/app/app_reducer.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/redux/auth/auth_actions.dart';
import 'package:road_keeper_mobile/ui/app/root_view.dart';
import 'package:road_keeper_mobile/ui/auth/login_page_vm.dart';
import 'package:road_keeper_mobile/ui/mortgage/morgage_input_screen.dart';
import 'package:road_keeper_mobile/ui/photo_fix_contour/photo_page_map.dart';

void main() {
  Intl.defaultLocale = 'ru';
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: createAppMiddleware(),
  );
  final mortGageBlock = MortGageCalculateBlock();
  runApp(MyApp(store, mortGageBlock));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final MortGageCalculateBlock mortGageBlock;
  MyApp(this.store, this.mortGageBlock);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MortGageProvider(
        mortGage: mortGageBlock,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('ru', 'RU'),
          ],
          home: MortGageInputPage(),
          routes: {
            LoginScreenVM.route: (context) =>
                RootContainer(child: LoginScreenVM()),
            HomePage.route: (context) => HomePage(),
            PhotoMapPage.route: (context) => PhotoMapPage(),
          },
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static final String route = "home_page";

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: StoreBuilder<AppState>(
          rebuildOnChange: false,
          builder: (context, store) {
            return RaisedButton(
              child: Text("выход"),
              onPressed: () {
                final Completer<Null> completer = Completer<Null>();
                completer.future.then((_) {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreenVM.route);
                });
                store.dispatch(LogOutAction(completer: completer));
              },
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
