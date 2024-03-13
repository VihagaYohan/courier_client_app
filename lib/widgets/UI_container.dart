import 'package:flutter/material.dart';

class UIContainer extends StatelessWidget {
  final Widget children;

  const UIContainer(
      {super.key,
      required this.children,
      this.paddingTop = 10,
      this.paddingBottom = 10,
      this.paddingLeft = 20,
      this.paddingRight = 20});

  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          bottom: paddingBottom,
          top: paddingTop),
      child: children,
    )));
  }
}
