import 'package:bight/models/bight_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      height:50,
      width: 50,
      alignment: Alignment.center,
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(BightColors.mediumOrange) ,)
  );
}