import 'package:flutter/material.dart';

class UIContainer extends StatelessWidget {
  final Widget children;

  const UIContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
      child: children,
    )));
  }
}
