import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Function buttonFunction;

  RoundedButton(
      {this.buttonColor, this.buttonText, @required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RoundedInput extends StatelessWidget {
  final String inputText;
  final Function inputFunction;
  final bool obscureText;
  final TextInputType keyboardType;

  RoundedInput(
      {this.inputText,
      @required this.inputFunction,
      this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      obscureText: obscureText != null ? obscureText : false,
      textAlign: TextAlign.center,
      onChanged: inputFunction,
      decoration: kRoundedInputDecoration.copyWith(hintText: inputText),
    );
  }
}
