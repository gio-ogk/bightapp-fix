import 'package:bight/api/invite_api/invite_api.dart';
import 'package:bight/global_widgets/buttons/gradient_button.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/login.dart';
import 'package:bight/models/size_config.dart';
import 'package:bight/provider/login_provider.dart';
import 'package:bight/services/locator.dart';
import 'package:bight/services/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';

class ExistingUserJoin extends StatefulWidget {
  final int _inviteId;
  final int _inviteCode;
  final String _workspaceName;
  final int _inviteUserId;
  ExistingUserJoin({required int inviteId, required int inviteCode, required String workspaceName, required int inviteUserId})
      : _inviteId = inviteId,
        _inviteCode = inviteCode,
        _workspaceName = workspaceName,
        _inviteUserId = inviteUserId;

  @override
  _ExistingUserJoinState createState() => _ExistingUserJoinState(inviteCode: _inviteCode, inviteId: _inviteId, workspaceName: _workspaceName, inviteUserId: _inviteUserId);
}

class _ExistingUserJoinState extends State<ExistingUserJoin> {
  final int inviteId;
  final int inviteCode;
  final String workspaceName;
  final int inviteUserId;
  _ExistingUserJoinState({required this.inviteId, required this.inviteCode, required this.workspaceName, required this.inviteUserId});

  FlutterSecureStorage storage = FlutterSecureStorage();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final user = locator<LoginProvider>();
  bool _isLoggedIn = false;
  bool _isInviteUser = false;
  @override
  void initState() {
    super.initState();
    if (user.status == Status.Authenticated){
      setState(() {
        _isLoggedIn = true;
      });
    }
    if(user.user != null && user.user.id == inviteUserId){
      setState(() {
        _isInviteUser = true;
      });
    }
  }

  static Widget svg = SvgPicture.asset(
    'assets/img/bight_full_logo.svg',
    color: const Color(0xFFFF5F00),
    height: 60,
    semanticsLabel: 'Bight Full Logo',
  );

  final FocusScopeNode _node = FocusScopeNode();

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
      return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.safeBlockHorizontal * 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              svg,
              (_isLoggedIn == false)
                ? Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 12),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.safeBlockVertical * 5.5,
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            autofillHints: [AutofillHints.username],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _usernameController,
                            validator: (value){
                              if(Validator.isValidEmail(value)){
                                return null;
                              } else {
                                return 'Please enter a valid email';
                              }
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: _node.nextFocus,
                          ),
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical * 5.5,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            autofillHints: const [AutofillHints.password],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) => (value.isEmpty) ? "Please Enter Password" : null,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        (user.status == Status.Authenticating)
                            ? Center(child: const CircularProgressIndicator())
                            : GradientButton(
                          buttonText: 'Login',
                          callBack: () async {
                            if(_formKey.currentState!.validate()){
                              Login userCredentials = Login(username: _usernameController.text, password: _passwordController.text);
                              await user.signIn(userCredentials: userCredentials, fromRememberMe: false).then((value){
                                if(value){
                                  setState(() {
                                    _isLoggedIn = true;
                                  });
                                }
                                if(!value) {
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(
                                        const SnackBar(content: Text('Invalid Credentials')));
                                }
                              });

                            }
                          },
                        ),
                      ],
                    )
                ),
              )
              : (_isInviteUser) ?
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 5),
                        child: Text(
                          'You\'ve been invited to join \n $workspaceName!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 12 ),
                        child: GradientButton(
                          buttonText: 'Accept Invite',
                          callBack: (){
                            inviteAccept(
                              inviteId: inviteId,
                              inviteCode: inviteCode,
                              storage: storage,
                            ).whenComplete(() => Navigator.of(context).pop());
                          },
                        ),
                      ),
                    ],
                  ) : Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 5),
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 5),
                    child: const Text(
                      'Please login to the correct account to accept this workspace invite',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 12 ),
                    child: GradientButton(
                      buttonText: 'Logout',
                      callBack: (){
                        user.signOut();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  }
}
