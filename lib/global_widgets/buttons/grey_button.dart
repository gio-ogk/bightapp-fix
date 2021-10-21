import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/size_config.dart';
import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  final VoidCallback _callBack;
  final String _buttonText;

  GreyButton({required String buttonText, required VoidCallback callBack})
    : _buttonText = buttonText,
      _callBack = callBack;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
      onPressed: _callBack,
      height: SizeConfig.safeBlockHorizontal * 12,
      minWidth: SizeConfig.safeBlockHorizontal * 100,
      elevation: 4,
      child: Text(
        _buttonText,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 4,
        ),
      ),
      color: BightColors.altBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2)
      ),
    );
  }
}
