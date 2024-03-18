import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UIDatePicker extends StatefulWidget {
  final TextEditingController controll;
  final String labelText;
  final Function onTap;
  final FormFieldValidator<String>? validator;

  const UIDatePicker(
      {super.key,
      required this.controll,
      required this.labelText,
      required this.onTap,
      this.validator});

  @override
  State<UIDatePicker> createState() => _UIDatePickerState();
}

class _UIDatePickerState extends State<UIDatePicker> {
  @override
  Widget build(BuildContext context) {
    Future<void> getDate() async {
      dynamic picked = DeviceUtils.getDatePicker(context);
      print(picked);
    }

    return GestureDetector(
      onTap: () {
        widget.onTap();
        dynamic date = DeviceUtils.getDatePicker(context);
        print(date.toString());
      },
      child: UITextField(
        controller: widget.controll,
        labelText: widget.labelText,
        readOnly: true,
        enabaled: false,
        validator: widget.validator,
      ),
    );
  }
}
