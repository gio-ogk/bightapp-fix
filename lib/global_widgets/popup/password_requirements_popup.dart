import 'package:bight/global_widgets/popup/popup.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';

class PasswordRequirementPopup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: PopupWidget(
          popupWidget: Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
              child: ListBody(
                children: [
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 100,
                    child: Text(
                      'Password must contain:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'At least 8 characters\nOne uppercase letter\nOne lowercase letter\nOne special character\nOne numerical character',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          fontWeight: FontWeight.bold,
                          color: BightColors.mediumOrange,
                          height: 1.5
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
