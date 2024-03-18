import 'package:flutter/material.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class SenderForm extends StatefulWidget {
  const SenderForm({super.key});

  @override
  State<SenderForm> createState() => _SenderFormState();
}

class _SenderFormState extends State<SenderForm> {
  final senderForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController datePickerController = TextEditingController();
    final TextEditingController timePickerController = TextEditingController();
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Form(
        key: senderForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const UIHeader(title: "Shipment Type"),
            const UIDropDown(),
            const UIHeader(
              title: "Sender Details",
            ),
            UITextField(
              controller: nameController,
              labelText: "Enter name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const UISpacer(),
            UITextField(
              controller: phoneNumberController,
              labelText: "Enter mobile number",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter mobile number";
                }
                return null;
              },
              keyboardType: TextInputType.number,
            ),
            const UISpacer(),
            UITextField(
              controller: emailController,
              labelText: "Email address",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const UISpacer(),
            UIDatePicker(
              controll: datePickerController,
              labelText: "Pickup Date",
              onTap: () {
                print('on trapping');
              },
              showIcon: true,
              suffixIcon: Icon(Icons.calendar_month),
              suffixIconColor: brightness == Brightness.dark
                  ? AppColors.white
                  : AppColors.dark,
            ),
            const UISpacer(),
            UITimePicker(
              controll: timePickerController,
              labelText: "Pickup Time",
              onTap: () {
                print('on tapping');
              },
              showIcon: true,
              suffixIcon: const Icon(Icons.timer_outlined),
              suffixIconColor: brightness == Brightness.dark
                  ? AppColors.white
                  : AppColors.dark,
            )
          ],
        ));
  }
}
