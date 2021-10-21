import 'package:bight/global_widgets/join_workspace/new_user_email.dart';
import 'package:bight/global_widgets/join_workspace/new_user_name.dart';
import 'package:bight/global_widgets/join_workspace/new_user_password.dart';
import 'package:bight/global_widgets/page_view_slider/page_view_slider.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/workspace_form.dart';
import 'package:bight/screens/create_workspace/workspace_phone.dart';
import 'package:flutter/material.dart';

class NewUserForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> _joinScaffold;
  final int _inviteId;
  final int _inviteCode;
  final String _userEmail;
  const NewUserForm({Key? key, required int inviteId, required int inviteCode, required GlobalKey<ScaffoldState> joinScaffold, required String userEmail})
      : _inviteId = inviteId,
        _inviteCode = inviteCode,
        _joinScaffold = joinScaffold,
        _userEmail = userEmail,
        super(key: key);
  @override
  _NewUserFormState createState() => _NewUserFormState(inviteId: _inviteId, inviteCode: _inviteCode, joinScaffold: _joinScaffold, userEmail: _userEmail);
}

class _NewUserFormState extends State<NewUserForm> {

  final int inviteId ;
  final int inviteCode;
  final GlobalKey<ScaffoldState>? joinScaffold;
  final String userEmail;
  _NewUserFormState({required this.inviteId, required this.inviteCode, this.joinScaffold, required this.userEmail});

  PageController _pageController = PageController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  WorkspaceForm _formData = WorkspaceForm();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _formKey = GlobalKey();
    _formData = WorkspaceForm();
    _formData.workspaceUserEmail = userEmail;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: PageViewSlider(
        pageController: _pageController,
        pageViews: [
          NewUserEmail(pageController: _pageController, formData: _formData,),
          NewUserFullName(pageController: _pageController, formData: _formData,),
          WorkspacePhone(pageController: _pageController,formData: _formData, pageNum: 2,),
          NewUserPassword(formData: _formData, inviteId: inviteId, inviteCode: inviteCode, formKey: _formKey,),
        ],
        lastPress: (){

        },
      ),
    );
  }
}
