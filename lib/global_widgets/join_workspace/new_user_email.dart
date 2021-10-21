import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/workspace_form.dart';
import 'package:flutter/material.dart';

import 'new_user_input.dart';


class NewUserEmail extends StatelessWidget {
  final WorkspaceForm _formData;
  final PageController _pageController;
  NewUserEmail({required WorkspaceForm formData, required PageController pageController,})
      : _formData = formData,
        _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: SizeConfig.safeBlockVertical * 5,
            height: SizeConfig.safeBlockVertical * 65,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Container(
              height: SizeConfig.safeBlockVertical * 60,
              width: SizeConfig.safeBlockHorizontal * 100,
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                'assets/img/bight_illustration_11.png',
                height: SizeConfig.safeBlockVertical * 0,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.safeBlockVertical * 20,
            child: Container(
              width: SizeConfig.safeBlockHorizontal * 100,
              padding: EdgeInsets.only(
                bottom: SizeConfig.safeBlockHorizontal * 10,
                left: SizeConfig.safeBlockHorizontal * 12,
                right: SizeConfig.safeBlockHorizontal * 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'What is your email address?',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  NewUserFormInput(
                    formData: _formData,
                    pageController: _pageController,
                    fieldPlaceholder: "Email Address",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
