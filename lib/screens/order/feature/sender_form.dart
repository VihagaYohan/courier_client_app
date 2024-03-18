import 'package:flutter/cupertino.dart';
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
    double boxWidth = (DeviceUtils.getScreenWidth(context) -
            (Constants.mediumSpace * 2) -
            50) /
        3;
    int index = 1;

    return Form(
        key: senderForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const UIHeader(title: "Shipment Type"),
            const UIDropDown(
              placeholderText: 'Select type',
              optionList: ['Standard', 'Express'],
            ),
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
            ),
            const UIHeader(title: "Package Size"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // first box
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    width: boxWidth,
                    height: boxWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: index == 0
                              ? AppColors.primary
                              : AppColors.darkGrey, // Border color
                          width: 1, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(Constants.smallSpace)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          UIIcon(
                            iconData: CupertinoIcons.cube_box,
                            size: 25,
                            iconColor:
                                index == 0 ? AppColors.primary : AppColors.dark,
                          ),
                          UITextView(
                            text: "< 1 KG",
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    color: index == 0
                                        ? AppColors.primary
                                        : AppColors.darkGrey),
                          )
                        ],
                      ),
                    ),
                  ),
                )

                // second box
                ,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    width: boxWidth,
                    height: boxWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: index == 1
                              ? AppColors.primary
                              : AppColors.darkGrey, // Border color
                          width: 1, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(Constants.smallSpace)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          UIIcon(
                            iconData: CupertinoIcons.cube_box,
                            size: 25,
                            iconColor:
                                index == 1 ? AppColors.primary : AppColors.dark,
                          ),
                          UITextView(
                            text: "3 KG < 10 KG",
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    color: index == 1
                                        ? AppColors.primary
                                        : AppColors.darkGrey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // third box
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Container(
                    width: boxWidth,
                    height: boxWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: index == 3
                              ? AppColors.primary
                              : AppColors.darkGrey, // Border color
                          width: 1, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(Constants.smallSpace)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          UIIcon(
                            iconData: CupertinoIcons.cube_box,
                            size: 25,
                            iconColor:
                                index == 3 ? AppColors.primary : AppColors.dark,
                          ),
                          UITextView(
                            text: "> 10 KG",
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 12,
                                    color: index == 3
                                        ? AppColors.primary
                                        : AppColors.darkGrey),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const UIHeader(title: "Courier Type"),
            const UIDropDown(
              placeholderText: 'Select courier type',
              optionList: ['Documents', 'Electronics', 'Clothes', 'Other'],
            ),
            const SizedBox(height: Constants.mediumSpace),
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.smallSpace,
                  vertical: Constants.smallSpace),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey, width: 1),
                  borderRadius: BorderRadius.circular(Constants.smallSpace)),
              child: UITextView(
                text: "Notes",
                textAlign: TextAlign.left,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12),
              ),
            )
          ],
        ));
  }
}
