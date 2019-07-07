import 'package:flutter/material.dart';
import 'package:road_keeper_mobile/ui/payments_list/payments_list_screen.dart';

import '../constants.dart';
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
                    backgroundColor: CustomThemeColors.backgroundColor,
                    elevation: 0,
                    centerTitle: true,
                    pinned: true,
                    floating: true,
                    title: const Text('MortGage calculator',
                        style: TextStyle(
                            inherit: true,
                            color: CustomThemeColors.primaryColor)),
                    forceElevated: innerBoxIsScrolled,
                    bottom: _getAppBar()
                  )
                ];
              },
              body: TabBarView(children: _widgetOptions))),
    );
  }

  Widget _getAppBar() {
    var tabBar = TabBar(
        indicatorColor: CustomThemeColors.primaryColor,
        indicatorWeight: 3.0,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 16.0),
        labelColor: CustomThemeColors.primaryColor,
        unselectedLabelColor: CustomThemeColors.primaryLight,
        tabs: [
          Tab(
            icon: Icon(CustomIcons.calc),
          ),
          Tab(icon: Icon(Icons.view_list))
        ]);
    return PreferredSize(
      child: Stack(
        children: [
          Container(
              height: tabBar.preferredSize.height,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomThemeColors.primaryLight.withOpacity(0.5),width: 3))),
              child: SizedBox.fromSize(size: tabBar.preferredSize,)
          ),
          tabBar
        ],
      ),
      preferredSize: tabBar.preferredSize,
    );
  }
}
