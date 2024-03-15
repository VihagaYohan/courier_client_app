import 'package:courier_client_app/utils/colors.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UITextButton extends StatelessWidget {
  final VoidCallback onPress;
  final String labelText;
  final Color textColor;
  final Color buttonColor;

  const UITextButton(
      {super.key,
      required this.onPress,
      required this.labelText,
      this.textColor = AppColors.primary,
      this.buttonColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: buttonColor, foregroundColor: AppColors.primary),
      child: UITextView(
        text: labelText,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
      ),
    );
  }
}
