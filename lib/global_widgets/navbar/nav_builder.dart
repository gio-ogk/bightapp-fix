import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CustomBuilder extends DelegateBuilder {
  final List<TabItem> items;
  final Color _tabBackgroundColor;
  final Color inactiveColor = Color(0xFFBBB7BD);
  final Color activeColor = Color(0xFFFF5F00);
  CustomBuilder(this.items, this._tabBackgroundColor);

  @override
  Widget build(BuildContext context, int index, bool active) {
    var navigationItem = items[index];
    var _color = active ? activeColor : inactiveColor;

    if (index == items.length ~/ 2) {
      return Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: activeColor),
        child: Icon(
          Icons.add,
          size: 40,
          color: _tabBackgroundColor,
        ),
      );
    }
    var _icon = active
        ? navigationItem.activeIcon ?? navigationItem.icon
        : navigationItem.icon;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(_icon, color: _color),
        ],
      ),
    );
  }

  @override
  bool fixed() {
    return true;
  }
}