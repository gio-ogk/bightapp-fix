import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: (positionIndex == currentIndex) ? 16 : 8,
      width: 8,
      decoration: BoxDecoration(
        color: positionIndex == currentIndex
            ? BightColors.mediumOrange
            : BightColors.offWhite,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
