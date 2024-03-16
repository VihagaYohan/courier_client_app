import 'package:courier_client_app/utils/colors.dart';
import 'package:courier_client_app/utils/utils.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/constants.dart';

class UITextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? obsecureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? showIcon;
  final Widget? icon;
  final Color? iconColor;

  const UITextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.obsecureText = false,
      this.textInputAction = TextInputAction.done,
      this.onFieldSubmitted,
      this.validator,
      this.showIcon = false,
      this.icon,
      this.iconColor = AppColors.primary})
      : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      showCursor: true,
      cursorColor: AppColors.primary,
      cursorWidth: 1,
      focusNode: FocusNode(),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.darkGrey, fontWeight: FontWeight.w300),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        prefixIcon: showIcon == true ? icon : const SizedBox.shrink(),
        prefixIconColor: iconColor,
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}
