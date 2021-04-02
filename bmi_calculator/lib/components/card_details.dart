import 'package:flutter/material.dart';
import 'constants.dart';

class CardDetails extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  CardDetails({this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style: kCardTextStyle,
        )
      ],
    );
  }
}