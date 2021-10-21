import 'package:bight/global_widgets/page_view_slider/page_view_arrows.dart';
import 'package:bight/global_widgets/page_view_slider/page_view_dots_column.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageViewSlider extends StatefulWidget {
  final PageController _pageController;
  final List<Widget> _pageViews;
  final VoidCallback _lastPress;
  final bool _showSkip;
  final VoidCallback _lastScroll;
  final bool _showHelp;
  final Color _skipColor;
  final VoidCallback _skipAction;
  final bool _scrollOut;
  PageViewSlider({@required PageController pageController, @required List<Widget> pageViews, @required VoidCallback lastPress, bool showSkip, VoidCallback lastScroll, bool showHelp, Color skipColor, VoidCallback skipAction, bool scrollOut})
    : _pageController = pageController,
      _pageViews = pageViews,
      _lastPress = lastPress,
      _showSkip = showSkip,
      _lastScroll = lastScroll,
      _showHelp = showHelp,
      _skipColor = skipColor,
      _skipAction = skipAction,
      _scrollOut = scrollOut;

  @override
  _PageViewSliderState createState() => _PageViewSliderState(pageController: _pageController, pageViews: _pageViews, lastPress: _lastPress, showSkip: _showSkip, lastScroll: _lastScroll, showHelp: _showHelp, skipColor: _skipColor, skipAction: _skipAction, scrollOut: _scrollOut );
}

class _PageViewSliderState extends State<PageViewSlider> {
  final PageController pageController;
  final List<Widget> pageViews;
  final VoidCallback lastPress;
  final bool showSkip;
  final VoidCallback lastScroll;
  final bool showHelp;
  final Color skipColor;
  final VoidCallback skipAction;
  final bool scrollOut;
  _PageViewSliderState({this.pageController, this.pageViews, this.lastPress, this.showSkip, this.lastScroll, this.showHelp, this.skipColor, this.skipAction, this.scrollOut});

  int currentIndex = 0;
  static const _kDuration = const Duration(milliseconds: 400);
  static const _kCurve = Curves.easeInOutCirc;
  List<Widget> pages;
  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
    if((scrollOut !=null && scrollOut) && currentIndex == pages.length - 1){
      lastPress();
      print("pop");
      //Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    if(scrollOut !=null && scrollOut){
      setState(() {
        pages = pageViews;
        pages.add(Container());
      });
    } else {
      setState(() {
        pages = pageViews;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        PageView(
          controller: pageController,
          onPageChanged: onChangedFunction,
          scrollDirection: Axis.vertical,
          children: pages,
        ),
        Positioned(
          top: SizeConfig.safeBlockHorizontal * 20,
          right: SizeConfig.safeBlockHorizontal * 8,
          child: PageViewsDotsColumn(currentIndex: currentIndex, numIndex: (scrollOut != null && scrollOut) ? pages.length-1 : pages.length,),
        ),
        Positioned(
          bottom: SizeConfig.safeBlockHorizontal * 10,
          right: SizeConfig.safeBlockHorizontal * 8,
          child: PageViewArrows(
            pageController: pageController,
            kDuration: _kDuration,
            kCurve: _kCurve,
            pages: (scrollOut !=null && scrollOut) ? pages.length - 2 : pages.length - 1,
            lastPress: lastPress,
          ),
        ),
        Positioned(
          bottom: SizeConfig.safeBlockHorizontal * 10,
          left: SizeConfig.safeBlockHorizontal * 8,
          child: (showSkip != null && showSkip)
           ? TextButton(
                onPressed: () async {
                  //pageController.animateToPage(pageViews.length - 1, duration: Duration(milliseconds: 500), curve: _kCurve);
                  if(skipAction != null){
                    skipAction();
                  } else {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('introSeen', true);
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (currentIndex == pageViews.length - 1) ? 'Continue' : 'Skip',
                      style: TextStyle(
                        color: (skipColor != null) ? skipColor : (currentIndex == pageViews.length - 1) ? BightColors.mediumOrange : BightColors.lightGrey,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontFamily: 'Barlow',
                      ),
                    ),
                    Icon(Icons.arrow_right_alt_rounded, color: (skipColor != null) ? skipColor : (currentIndex == pageViews.length - 1) ? BightColors.mediumOrange : BightColors.lightGrey,),
                  ],
                )
              )
              : (showHelp != null && showHelp)
                  ? TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/get-help');
                      },
                      child: Text(
                        'Need Help?',
                        style: TextStyle(
                          color: BightColors.lightGrey,
                          fontFamily: 'Barlow',
                          fontSize: SizeConfig.safeBlockHorizontal * 4
                        ),
                      ),
                    )
                  : Container(),
        )
      ],
    );
  }
}
