import 'dart:convert';

import 'package:courier_client_app/navigation/bottomNavigation.dart';
import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// models
import 'package:courier_client_app/models/models.dart';

class ContactDataScreen extends StatefulWidget {
  final dynamic userData;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  ContactDataScreen({super.key, this.userData});

  @override
  State<StatefulWidget> createState() {
    return ContactDataScreenState();
  }
}

class ContactDataScreenState extends State<ContactDataScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  // fetch data from shared preferences
  Future<UserInfo?> getUserInfo() async {
    try {
      final response = await Helper.getData<String>(Constants.user);
      if (response?.isEmpty == false) {
        UserInfo userInfo = UserInfo.fromJson(jsonDecode(response!));
        widget.emailController.text = userInfo.email;
        widget.nameController.text = userInfo.name;
        widget.phoneNumberController.text = userInfo.phoneNumber;
      }
    } catch (e) {
      print("Error at loading user details $e");
    }
  }

  // save contact details
  handleSaveContactDetails(context) async {
    try {
      final response = await Helper.getData<String>(Constants.user);
      if (response?.isEmpty == false) {
        UserInfo userInfo = UserInfo.fromJson(jsonDecode(response!));
        Map<String, dynamic> userInfoPayload = {
          ...userInfo.toJson(),
          'address': widget.addressController.text
        };
        await Helper.setData<String>(
            Constants.user, userInfoPayload.toString());

        DeviceUtils.showAlertDialog(
            context,
            "Profile updated\nsuccessfully",
            "Your profile data have been update successfully",
            "Go To Home", () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }, Icons.check, iconSize: 30);
      }
    } catch (e) {
      print("Error at saving contact details $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        paddingTop: Constants.largeSpace,
        paddingBottom: Constants.mediumSpace,
        children: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  formTitle(context),
                  const SizedBox(height: Constants.largeSpace),

                  // name
                  UITextField(
                    controller: widget.nameController,
                    labelText: "Enter your name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    showIcon: true,
                    icon: const UIIcon(iconData: Icons.person),
                  ),
                  const SizedBox(height: 20),

                  // address
                  UITextField(
                      controller: widget.addressController,
                      labelText: "Enter your address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your address";
                        }
                        return null;
                      },
                      showIcon: true,
                      icon: const UIIcon(iconData: Icons.pin_drop)),
                  const SizedBox(height: 20),

                  // phone number
                  UITextField(
                    controller: widget.phoneNumberController,
                    labelText: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                    showIcon: true,
                    icon: const UIIcon(
                      iconData: Icons.phone,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // email
                  UITextField(
                    controller: widget.emailController,
                    labelText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    showIcon: true,
                    icon: const UIIcon(iconData: Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email address";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            UIElevatedButton(
                label: "Save",
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    handleSaveContactDetails(context);
                  }
                })
          ],
        ));
  }

  // title widget
  UITextView formTitle(BuildContext context) {
    return UITextView(
      text: "Let's check your details",
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
      textAlign: TextAlign.right,
    );
  }
}
