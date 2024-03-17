import 'package:courier_client_app/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// models
import 'package:courier_client_app/models/models.dart';
// ignore: library_prefixes
import 'package:courier_client_app/models/User.dart' as UserInfoModel;

class ProfileScreen extends StatefulWidget {
  final dynamic userData;

  const ProfileScreen({super.key, this.userData});

  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AdditionalUserInfo additionalUserInfo = widget.userData.additionalUserInfo;
    AuthCredential crdentialInfo = widget.userData.credential;
    dynamic user = widget.userData.user;

    UserInfoModel.UserInfo userInfo = UserInfoModel.UserInfo(
        isNewUser: additionalUserInfo.isNewUser,
        profile: additionalUserInfo.profile,
        providerId: additionalUserInfo.providerId,
        username: additionalUserInfo.username,
        authorizationCode: additionalUserInfo.authorizationCode);

    UserInfoModel.UserCredential userCredential = UserInfoModel.UserCredential(
        providerId: crdentialInfo.providerId,
        signInMethod: crdentialInfo.signInMethod,
        token: crdentialInfo.token,
        accessToken: crdentialInfo.accessToken);

    UserInfoModel.UserProfile userProfile = UserInfoModel.UserProfile(
        displayName: user.displayName,
        email: user.email,
        phoneNumber: user.phoneNumber);

    UserInfoModel.User userPayload = UserInfoModel.User(
        id: 'user',
        userInfo: userInfo,
        userCredential: userCredential,
        user: userProfile);

    final TextEditingController nameController =
        TextEditingController(text: userPayload.user.displayName ?? "");
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController =
        TextEditingController(text: userPayload.user.email ?? "");

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
                          return "Please enter your phone number";
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
                  /* if (formKey.currentState!.validate()) {
                    print('form values are below');
                    String name = nameController.text;
                    String address = addressController.text;
                    String phoneNumber = phoneNumberController.text;
                    String email = emailController.text;

                    print('$name - $address - $phoneNumber - $email');
                  } */
                  DeviceUtils.showAlertDialog(
                      context,
                      "Profile updated\nsuccessfully",
                      "Your profile data have been update successfully",
                      "Go To Home", () {
                    Navigator.of(context).pop();
                  }, Icons.check, iconSize: 30);
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
