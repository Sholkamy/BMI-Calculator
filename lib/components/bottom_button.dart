import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.toDo});
  final String buttonTitle;
  final Function toDo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDo,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        height: 60.0,
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
        color: kBottomContainerColour,
      ),
    );
  }
}
