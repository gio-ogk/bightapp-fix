import 'package:bight/global_widgets/icons/bight_custom_icons_icons.dart';
import 'package:bight/screens/dashboard/pages/pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar {
  Widget currentScreen;
  bool showBottomBar;

  BottomNavBar({
    required this.currentScreen,
    required this.showBottomBar,
  });

  final List<Widget> _screens =  [
    Home(),
    Search(),
    Camera(),
    Folders(),
    Profile(),
  ];

  List<Widget> get screens => _screens;

  List<TabItem> _items = <TabItem>[
    TabItem(icon: BightCustomIcons.custom_home,),
    TabItem(icon: BightCustomIcons.custom_search,),
    TabItem(icon: Icons.plus_one, title: 'Add'),
    TabItem(icon: BightCustomIcons.custom_favorite,),
    TabItem(icon: BightCustomIcons.custom_user,),
  ];

  List<TabItem> get items => _items;

}