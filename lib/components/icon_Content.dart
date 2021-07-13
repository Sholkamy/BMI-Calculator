import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.iconName, this.icomText});

  final IconData iconName;
  final String icomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(icomText, style: kLabelTextStyle)
      ],
    );
  }
}
