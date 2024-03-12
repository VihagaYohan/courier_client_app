import 'package:flutter/material.dart';

class UITextView extends StatelessWidget {
  const UITextView(
      {super.key,
      required this.text,
      this.textStyle,
      this.textAlign = TextAlign.center});

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle, textAlign: textAlign);
  }
}
