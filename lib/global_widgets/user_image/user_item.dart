import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User _user;
  UserItem({ User user }) : _user = user;

  @override
  Widget build(BuildContext context) {
    String fullName = "${_user.firstName} ${_user.lastName}";
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: (_user.profileImageUrl != "")
          ? Image.network(
              _user.profileImageUrl,
              height: SizeConfig.safeBlockHorizontal * 30,
              width: SizeConfig.safeBlockHorizontal * 30,
              fit: BoxFit.contain ,
              alignment: Alignment.bottomCenter,
            )
            : Image.asset(
                'assets/img/placeholder-logo.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          (fullName.length > 12) ? "${fullName.substring(0,12)}..." : fullName,
          style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              fontWeight: FontWeight.w700
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
