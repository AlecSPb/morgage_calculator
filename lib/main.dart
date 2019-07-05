import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/redux/app/app_middleware.dart';
import 'package:road_keeper_mobile/redux/app/app_reducer.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';

import 'ui/home_page.dart';

void main() {
  Intl.defaultLocale = 'ru';
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: createAppMiddleware(),
  );
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightGreen,
         // scaffoldBackgroundColor: Colors.lightGreen
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ru', 'RU'),
        ],
        home: HomePage(),
      ),
    );
  }
}
