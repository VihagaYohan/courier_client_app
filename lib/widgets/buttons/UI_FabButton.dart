import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UIFabButton extends StatelessWidget {
  final Widget child;
  final Function onClick;

  const UIFabButton({super.key, required this.child, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onClick();
      },
      child: child,
    );
  }
}
