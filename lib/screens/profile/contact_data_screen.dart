import 'package:courier_client_app/navigation/bottomNavigation.dart';
import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// models
import 'package:courier_client_app/models/models.dart';
// ignore: library_prefixes
import 'package:courier_client_app/models/UserInfo.dart' as UserInfoModel;

class ContactDataScreen extends StatefulWidget {
  final dynamic userData;

  const ContactDataScreen({super.key, this.userData});

  @override
  State<StatefulWidget> createState() {
    return ContactDataScreenState();
  }
}

class ContactDataScreenState extends State<ContactDataScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AdditionalUserInfo additionalUserInfo = widget.userData.additionalUserInfo;
    AuthCredential crdentialInfo = widget.userData.credential;
    dynamic user = widget.userData.user;

    print(user);

    UserInfoModel.UserInfo userPayload = UserInfoModel.UserInfo(
        name: user.displayName ?? "",
        address: "",
        phoneNumber: "",
        email: user.phoneNumber,
        photoUrl: user.photoURL);

    final TextEditingController nameController =
        TextEditingController(text: userPayload.name);
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController =
        TextEditingController(text: user.email ?? "");

    // save user data into local db
    void saveData() async {
      /* await localDB.create(
          name: nameController.text,
          address: addressController.text,
          phoneNumber: phoneNumberController.text,
          email: emailController.text); */
    }

    // handle alert message and navigation
    void handleNavigation() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AppBottomNavigation()));
    }

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
                  UITextField(
                    controller: nameController,
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
                  UITextField(
                      controller: addressController,
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
                  UITextField(
                    controller: phoneNumberController,
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
                  UITextField(
                    controller: emailController,
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
                    saveData();
                    DeviceUtils.showAlertDialog(
                        context,
                        "Profile updated\nsuccessfully",
                        "Your profile data have been update successfully",
                        "Go To Home", () {
                      Navigator.of(context).pop();
                      handleNavigation();
                    }, Icons.check, iconSize: 30);
                  }
                  /* DeviceUtils.showAlertDialog(
                      context,
                      "Profile updated\nsuccessfully",
                      "Your profile data have been update successfully",
                      "Go To Home", () {
                    Navigator.of(context).pop();
                  }, Icons.check, iconSize: 30); */
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

  // field icon widget
}
