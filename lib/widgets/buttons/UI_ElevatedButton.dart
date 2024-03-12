import 'package:flutter/material.dart';

class UIElevatedButton extends StatelessWidget {
  final double? width;
  final String label;
  final Function onPress;

  const UIElevatedButton(
      {super.key,
      this.width = double.infinity,
      required this.label,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        child: Text(label),
      ),
    );
  }
}
