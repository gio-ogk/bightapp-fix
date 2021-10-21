import 'package:bight/api/account_api/account_api.dart';
import 'package:bight/global_widgets/buttons/gradient_button.dart';
import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/bight_topic.dart';
import 'package:bight/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'grid_item.dart';

class UserTopics extends StatefulWidget {
  final VoidCallback _customFunction;
  UserTopics({VoidCallback customFunction})
    : _customFunction = customFunction;

  @override
  _UserTopicsState createState() => _UserTopicsState();
}

class _UserTopicsState extends State<UserTopics> {
  List<Topic> topicList;
  List<Topic> selectedList;
  List<int> selectedTopicIDs;
  User _user;
  FlutterSecureStorage storage = FlutterSecureStorage();

  loadList() {
    topicList = [];
    selectedList = [];
    topicList.add(Topic(37, "Team Updates"));
    topicList.add(Topic(38, "Best Practices"));
    topicList.add(Topic(39, "Sales Successes"));
    topicList.add(Topic(40, "Idea Sharing"));
    topicList.add(Topic(41, "Team Wins"));
    topicList.add(Topic(13, "Beat the Competition"));
    topicList.add(Topic(14, "Win Back"));
    topicList.add(Topic(15, "New Business"));
    topicList.add(Topic(16, "Cross Sell/Upsell"));
    topicList.add(Topic(42, "Product Launch"));
    topicList.add(Topic(18, "Partnerships"));
    topicList.add(Topic(19, "Celebrate/Thank You"));
  }

  Future<void> addTopics() async {
    selectedTopicIDs = [];
    for(var topic in selectedList) selectedTopicIDs.add(topic.id);
    updateUser(storage: storage, firstName: _user.firstName, lastName: _user.lastName, bio: _user.description, location: _user.location, title: _user.title, userTopics: selectedTopicIDs);
  }
  @override
  void initState() {
    super.initState();
    loadList();
    getAccount(storage: storage).then((value){
      setState(() {
        _user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal:SizeConfig.safeBlockHorizontal * 5),
          child: Text(
            'Select the topics that you are most interested in learning about.',
            style: Theme.of(context).textTheme.headline2,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Select as many as apply.',
          style: TextStyle(
              color: BightColors.mediumOrange,
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
          maxLines: 1,
        ),
        SizedBox(height: 20),
        Container(
          height: SizeConfig.safeBlockVertical * 40,
          child: ListView(
            padding: EdgeInsets.only(top:0, bottom: 0),
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  for(Topic x in topicList) GridItem(
                    topic: x,
                    isSelected: (bool value) {
                      setState(() {
                        if (value) {
                          selectedList.add(x);
                        } else {
                          selectedList.remove(x);
                        }
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        GradientButton(
          hasIcon: false,
          buttonText: "Continue to Your Workspace",
          callBack: () {
            addTopics().whenComplete(() {
              if(widget._customFunction != null){
                widget._customFunction();
              }
            });
          },
        )
      ],
    );
  }
}
