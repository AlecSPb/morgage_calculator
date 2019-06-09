import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:road_keeper_mobile/block/motgage_calculate/mortgage_calculate_block.dart';
import 'package:road_keeper_mobile/redux/app/app_middleware.dart';
import 'package:road_keeper_mobile/redux/app/app_reducer.dart';
import 'package:road_keeper_mobile/redux/app/app_state.dart';
import 'package:road_keeper_mobile/ui/mortgage/morgage_input_screen.dart';

import 'ui/home_page.dart';

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
          home: HomePage(),
        ),
      ),
    );
  }
}
