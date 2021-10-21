import 'package:bight/global_widgets/buttons/gradient_button.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/workspace_form.dart';
import 'package:bight/services/locator.dart';
import 'package:bight/services/validator.dart';
import 'package:flutter/material.dart';
import 'package:bight/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewUserSubmit extends StatefulWidget {
  final int _inviteId;
  final int _inviteCode;
  final GlobalKey<FormState> _formKey;
  final WorkspaceForm _formData;
  NewUserSubmit({
    WorkspaceForm formData,
    GlobalKey<FormState> formKey,
    int inviteId,
    int inviteCode,
  })  : _formData = formData,
        _formKey = formKey,
        _inviteId = inviteId,
        _inviteCode = inviteCode;

  @override
  _NewUserSubmitState createState() => _NewUserSubmitState();
}

class _NewUserSubmitState extends State<NewUserSubmit> {
  final _workspacePasswordController = TextEditingController();
  final _workspaceConfirmPasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final createWorkspace = locator<SignUpProvider>();

    _submitForm() async {
      if (widget._formKey.currentState.validate()) {
        widget._formData.password = _workspacePasswordController.text;
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('Submitting...')));
        await createWorkspace.newUserAcceptInvite(inviteId: widget._inviteId, inviteCode: widget._inviteCode,formData: widget._formData).then((result) async {
          if(result){
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Success!')));
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('tutorialSeen', false);
            await prefs.setBool('loginAfterSignup', true);
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          } else {
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('There was an issue creating your account.')));
          }
        });
      }
    }

    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: SizeConfig.safeBlockVertical * 6,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.all(0),
              filled: true,
              fillColor: BightColors.altBackground,
              hintText: 'Password',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1EDF3),
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1EDF3),
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _workspacePasswordController,
            obscureText: _obscureText,
            validator: (val){
              if (val.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please complete before continuing'), duration: Duration(milliseconds: 600),));
                return '';
              }
              if(!Validator.isValidPassword(val)){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Password'), duration: Duration(milliseconds: 500),));
                return '';
              }
              return null;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: SizeConfig.safeBlockVertical * 6,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.all(0),
              filled: true,
              fillColor: BightColors.altBackground,
              hintText: 'Confirm Password',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1EDF3),
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFF1EDF3),
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  )
              ),
            ),
            controller: _workspaceConfirmPasswordController,
            obscureText: _obscureText,
            validator: (val) {
              if (val.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please complete before continuing'), duration: Duration(milliseconds: 600),));
                return '';
              }
              if (val != _workspacePasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match'), duration: Duration(milliseconds: 600),));
                return '';
              }
              return null;
            },
          ),
        ),
        GradientButton(
          buttonText: "Continue",
          callBack: _submitForm,
        ),
      ],
    );
  }
}
