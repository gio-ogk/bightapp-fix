import 'package:bight/global_widgets/page_view_slider/page_view_dot.dart';
import 'package:flutter/material.dart';

class PageViewsDotsColumn extends StatelessWidget {
  final int currentIndex;
  final int numIndex;
  PageViewsDotsColumn({@required this.currentIndex, @required this.numIndex});

  List<Widget> buildDots() {
    List<Widget> dots = [];
    for(int x = 0; x < numIndex; x ++ ){
      dots.add(
        Container(
          margin: EdgeInsets.only(bottom: (x != numIndex-1) ? 10 : 0),
          child: Indicator(positionIndex: x, currentIndex: currentIndex,)
        )
      );
    }
    return dots;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildDots(),
    );
  }
}
