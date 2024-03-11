import 'package:flutter/material.dart';

class UIContainer extends StatelessWidget {
  final Widget children;

  const UIContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: children);
  }
}
