import 'package:bight/global_widgets/icons/bight_video_icons_icons.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/size_config.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String _buttonText;
  final bool? _hasIcon;
  final VoidCallback _callBack;

  const GradientButton({required String buttonText, bool? hasIcon, required VoidCallback callBack})
      : _buttonText = buttonText,
        _hasIcon = hasIcon,
        _callBack = callBack;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockHorizontal * 12,
      width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: <Color>[
            BightColors.lightOrange,
            BightColors.mediumOrange,
            BightColors.darkOrange,
          ],
        ),
      ),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _buttonText,
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.white,
              ),
            ),
            (_hasIcon == null || _hasIcon == false)
                ? Container()
                : Container(
              margin: const EdgeInsets.only(left: 10),
              child: Icon(
                BightVideoIcons.custom_play,
                size: SizeConfig.safeBlockHorizontal * 3,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: _callBack,
      ),
    );
  }
}
