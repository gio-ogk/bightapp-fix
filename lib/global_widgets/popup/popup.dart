import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  final Widget titleContent;
  final Widget popupWidget;
  final VoidCallback exitOverride;
  PopupWidget({this.titleContent ,this.popupWidget, this.exitOverride});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Color(0x00000000),
      title: titleContent,
      content:Stack(
        children: [
          Positioned(
              child: ClipPath(
                child: Material(
                  color: Colors.white,
                  child:SingleChildScrollView(
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: <Widget>[
                        popupWidget,
                      ],
                    ),
                  ),
                ),
                clipper: _MyClipper(),
              )
          ),
          Positioned(
            top: -15,
            right: -15,
            child: IconButton(
              icon: Icon(Icons.close,color: Colors.white,),
              onPressed: () {
                if(exitOverride != null){
                  exitOverride();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width-radius * 4.5, 0)
      ..arcToPoint(Offset(size.width, radius *4.5), radius: Radius.circular(radius*4.5), clockwise: false)
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height),radius: Radius.circular(radius))
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius))
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
