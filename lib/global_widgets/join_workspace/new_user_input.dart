import 'package:bight/global_widgets/buttons/gradient_button.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';

import 'package:bight/models/workspace_form.dart';
import 'package:flutter/material.dart';

class NewUserFormInput extends StatefulWidget {
  final WorkspaceForm _formData;
  final PageController _pageController;
  final String _fieldPlaceholder;

  NewUserFormInput({
    WorkspaceForm formData,
    PageController pageController,
    String fieldPlaceholder,
  })  : _formData = formData,
        _pageController = pageController,
        _fieldPlaceholder = fieldPlaceholder;

  @override
  _NewUserFormInputState createState() => _NewUserFormInputState();
}

class _NewUserFormInputState extends State<NewUserFormInput> {
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final workspaceInputController = TextEditingController();

  void _onButtonPress() {
    if (workspaceInputController.text != '') {
      if (widget._pageController.page == 0) {
        widget._formData.workspaceUserEmail = workspaceInputController.text;
      }
      widget._pageController.nextPage(duration: _kDuration, curve: _kCurve);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      workspaceInputController.text = widget._formData.workspaceUserEmail;
    });
  }

  @override
  void dispose() {
    workspaceInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: SizeConfig.safeBlockVertical * 6,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: TextFormField(
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.5,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              filled: true,
              fillColor: BightColors.altBackground,
              hintText: widget._fieldPlaceholder,
              enabledBorder: OutlineInputBorder(
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
            controller: workspaceInputController,
            validator: (val) {
              if (val.isEmpty) {
                return 'Please complete before continuing';
              }
              return null;
            },
          ),
        ),
        GradientButton(
          buttonText: 'Continue',
          hasIcon: false,
          callBack: _onButtonPress,
        )
      ],
    );
  }
}
