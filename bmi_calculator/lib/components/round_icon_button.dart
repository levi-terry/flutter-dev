import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final Function buttonAction;
  final IconData icon;

  RoundIconButton({@required this.buttonAction, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      onPressed: buttonAction,
      shape: CircleBorder(),
      fillColor: kIconColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}