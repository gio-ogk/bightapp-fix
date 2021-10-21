import 'package:bight/global_widgets/buttons/gradient_button.dart';
import 'package:bight/global_widgets/buttons/grey_button.dart';
import 'package:bight/global_widgets/popup/popup.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';

class ExitPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: PopupWidget(
        popupWidget: Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 10, horizontal: SizeConfig.safeBlockHorizontal * 6,),
            child: ListBody(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 4, horizontal: SizeConfig.safeBlockHorizontal * 4),
                  width: SizeConfig.safeBlockHorizontal * 100,
                  child: Text(
                    'But we were just getting to know each other',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4.5),
                  margin: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 2 ,bottom: SizeConfig.safeBlockHorizontal * 8),
                  child: Text(
                    'Are you sure you want to exit the sign up process? Any information you\'ve provided so far will be lost.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      height: 1.5,
                      color: BightColors.lightGrey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 3),
                  child: GradientButton(
                    buttonText: 'NOOO! Go Back!',
                    callBack: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 4),
                  child: GreyButton(
                    buttonText: 'Discard & Exit',
                    callBack: (){
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

