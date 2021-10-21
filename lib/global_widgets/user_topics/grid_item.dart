import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:bight/models/bight_topic.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final Topic topic;
  final ValueChanged<bool> isSelected;
  final bool userTopic;

  GridItem({this.topic, this.isSelected, this.userTopic});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  bool isSelected = false;
  setSelected() async {
    if(widget.userTopic){
      setState(() {
        isSelected = true;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    setSelected();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return OutlinedButton(
        onPressed: (){
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
        },
        child: Text(
          widget.topic.topicName,
          style: TextStyle(
            color: isSelected ? BightColors.mediumOrange : BightColors.buttonGrey,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.w600
          ),
          maxLines: 1,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: isSelected ? 2 : 1,
            color:  isSelected ? BightColors.mediumOrange : BightColors.buttonGrey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),

          ),
        )
    );
  }
}
