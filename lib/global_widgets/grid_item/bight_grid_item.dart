import 'package:bight/global_widgets/size_config/size_config.dart';
import 'package:bight/models/bight.dart';
import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';

class BightGridViewItem extends StatelessWidget {
  final Bight bight;
  const BightGridViewItem({Key? key, required this.bight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: TextButton(

        child: Column(
          children: [
            Container(
                height: SizeConfig.safeBlockHorizontal * 55,
                width: SizeConfig.safeBlockHorizontal * 100,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    bight.thumbnailUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                )
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Container(
                  height:6,
                  width: 6,
                  margin: const EdgeInsets.only(right:4),
                  decoration: BoxDecoration(
                      color: (bight.ownerRole == 'workspace-admin')
                          ? BightColors.mediumOrange
                          : (bight.ownerRole == 'power-user')
                              ? BightColors.userPurple
                              : BightColors.userBlue,
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
                Text(
                    bight.postedBy,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA39DA7)
                    )
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 100,
              child: Text((bight.bightTitle.length > 50) ? "${bight.bightTitle.substring(0,50)}..." : bight.bightTitle,
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                  fontWeight: FontWeight.bold,
                  color: BightColors.darkGrey,
                ),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),

          ],
        ),
        onPressed: () => {
          //Open VideoApp Widget with Bight object
          Navigator.pushNamed(context, '/video-player', arguments: bight)
              .then((value) {
            if(value != null) {

            }
          })
        },
      ),
    );
  }
}