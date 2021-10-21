import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/workspace_form.dart';
import 'package:bight/screens/create_workspace/user_name_form.dart';
import 'package:flutter/material.dart';

class NewUserFullName extends StatelessWidget {
  final WorkspaceForm _formData;
  final PageController _pageController;

  NewUserFullName({
    WorkspaceForm formData,
    PageController pageController,
  })  : _formData = formData,
        _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: SizeConfig.safeBlockVertical * 10,
            height: SizeConfig.safeBlockVertical * 60,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Container(
              height: SizeConfig.safeBlockVertical * 60,
              width: SizeConfig.safeBlockHorizontal * 100,
              padding: EdgeInsets.all(0.0),

              child: Image.asset(
                'assets/img/bight_illustration_6.png',
                fit: BoxFit.fitWidth,
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
                    'What should we call you?',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  CreateWorkspaceNameForm(
                    formData: _formData,
                    pageController: _pageController,
                    fieldPlaceholder: "Your Name",
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
