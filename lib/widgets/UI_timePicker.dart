import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UITimePicker extends StatefulWidget {
  final TextEditingController controll;
  final String labelText;
  final Function onTap;
  final FormFieldValidator<String>? validator;
  final bool? showIcon;
  final Icon? suffixIcon;
  final Color? suffixIconColor;

  const UITimePicker(
      {super.key,
      required this.controll,
      required this.labelText,
      required this.onTap,
      this.validator,
      this.showIcon = false,
      this.suffixIcon,
      this.suffixIconColor});

  @override
  State<UITimePicker> createState() => _UITimePickerState();
}

class _UITimePickerState extends State<UITimePicker> {
  @override
  Widget build(BuildContext context) {
    Future<void> getDate() async {
      dynamic picked = DeviceUtils.getDatePicker(context);
      print(picked);
    }

    return GestureDetector(
      onTap: () {
        widget.onTap();
        dynamic date = DeviceUtils.getTimePicker(context);
        print(date.toString());
      },
      child: UITextField(
        controller: widget.controll,
        labelText: widget.labelText,
        readOnly: true,
        enabaled: false,
        validator: widget.validator,
        showSuffixIcon: widget.showIcon,
        suffixIcon: widget.showIcon == true ? widget.suffixIcon : null,
        suffixIconColor:
            widget.showIcon == true ? widget.suffixIconColor : AppColors.dark,
      ),
    );
  }
}
