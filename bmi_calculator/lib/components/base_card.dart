import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onPress;

  BaseCard({@required this.cardColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardColor,
        ),
      ),
    );
  }
}