import 'package:flutter/material.dart';

class PageViewArrows extends StatefulWidget {
  final PageController pageController;
  final kDuration;
  final kCurve;
  final VoidCallback lastPress;
  final int pages;
  PageViewArrows({this.pageController, this.kDuration, this.kCurve, this.lastPress, this.pages});

  @override
  _PageViewArrowsState createState() => _PageViewArrowsState();
}

class _PageViewArrowsState extends State<PageViewArrows> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.keyboard_arrow_up_rounded),
              color: Color(0xFFBBB7BD),
              iconSize: 36,
              onPressed: () {
                widget.pageController.previousPage(duration: widget.kDuration, curve: widget.kCurve);
                current -= 1;
              },
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              color: Color(0xFFFF5F00),
              iconSize: 36,
              onPressed: () {
                if(widget.pageController.page == widget.pages){
                  widget.lastPress();
                } else {
                  widget.pageController.nextPage(duration: widget.kDuration, curve: widget.kCurve);
                  current += 1;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


