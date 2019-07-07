import 'package:flutter/material.dart';
import 'package:road_keeper_mobile/ui/payments_list/payments_list_screen.dart';

import 'calculator/morgage_input_screen.dart';
import 'custom_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MortGageInputPage(),
    PaymentsListPageContainer()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    centerTitle: true,
                    pinned: true,
                    floating: true,
                    title: const Text('MortGage calculator'),
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(tabs: [
                      Tab(icon: Icon(CustomIcons.calc)),
                      Tab(icon: Icon(Icons.view_list))
                    ]),
                  )
                ];
              },
              body: TabBarView(children: _widgetOptions))),
    );
  }
}
