import 'package:bight/api/user_api/user_get.dart';
import 'package:bight/global_widgets/loading/loading_indicator.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/user.dart';
import 'package:bight/screens/user_page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserImage extends StatelessWidget {
  final FlutterSecureStorage _storage;
  final int _userID;
  final bool _disableUserImageClick;
  final String _ownerThumbnailUrl;
  UserImage({FlutterSecureStorage storage, int userID, bool disableUserImageClick, String ownerThumbnailUrl})
      : _storage = storage,
        _userID = userID,
        _disableUserImageClick = disableUserImageClick,
        _ownerThumbnailUrl = ownerThumbnailUrl;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(_ownerThumbnailUrl != null && _ownerThumbnailUrl != '') {
      return CircleAvatar(
        backgroundImage: NetworkImage(_ownerThumbnailUrl),
      );
    } else if (_ownerThumbnailUrl != null && _ownerThumbnailUrl == ''){
      return CircleAvatar(
        backgroundImage: AssetImage('assets/img/placeholder-logo.jpg',),
      );
    } else {
      return FutureBuilder(
          future: getUser(_storage, _userID),
          builder: (context, snapshot){
            if(snapshot.hasData){
              Map userMap = snapshot.data;
              User user = User.fromDatabaseJson(data: userMap);
              String image = (userMap['image_data'] != false && userMap['image_data'] != null) ? userMap['image_data'][0] : "";
              if(image != "") {
                return InkWell(
                  onTap: (){
                    if(!_disableUserImageClick){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreen(user: user,)));
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                  ),
                );
              } else {
                return InkWell(
                  onTap: (){
                    if(!_disableUserImageClick) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserProfileScreen(user: user,)));
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/placeholder-logo.jpg',),
                  ),
                );
              }
            }
            return LoadingIndicator();
          }
      );
    }

  }
}