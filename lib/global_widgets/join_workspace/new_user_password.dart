import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/workspace_form.dart';
import 'package:flutter/material.dart';

import 'new_user_password_input.dart';

class NewUserPassword extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final WorkspaceForm formData;
  final int inviteId;
  final int inviteCode;
  NewUserPassword({this.formData, this.formKey, this.inviteId, this.inviteCode,});

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
                'assets/img/bight_illustration_9.png',
                fit: BoxFit.cover,
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
                    'Secure your account',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  NewUserSubmit(
                    formData: formData,
                    formKey: formKey,
                    inviteCode: inviteCode,
                    inviteId: inviteId,
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


