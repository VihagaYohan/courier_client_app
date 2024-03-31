import 'dart:convert';

import 'package:courier_client_app/models/SignInResponse.dart';
import 'package:courier_client_app/utils/colors.dart';
import 'package:courier_client_app/utils/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// services
import 'package:courier_client_app/services/service.dart';

// models
import 'package:courier_client_app/models/models.dart';
import 'package:courier_client_app/models/UserInfo.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';
import 'package:provider/provider.dart';

// providers
import 'package:courier_client_app/provider/providers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // handle user google sign-in
  handleAuthentication(SignIn payload) async {
    try {
      final response = await Authentication.signInUser(payload);
      print(response['success']);
      /*   final userData = response['data']['user'];
      final tokenData = response['data']['token'];

      UserInfo(
              id: userData['_id'],
              name: userData['name'],
              email: userData['email'],
              phoneNumber: userData['phoneNumber'],
              role: userData['role'],
              createdOn: userData['createdOn'],
              token: tokenData); */
    } catch (e) {
      print("Error at logging $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: 'vihagayohan94@gmail.com');
    final TextEditingController passwordController =
        TextEditingController(text: 'asdfasdf');
    final loginForm = GlobalKey<FormState>();

    return Consumer<AuthProvider>(builder: (context, auth, child) {
      if (auth.isLoading) {
        return const UIProgressIndicator(
          title: "Logging in...",
        );
      }
      return UIContainer(
          children: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 50),

          // logo
          const Image(
              image: Svg('assets/images/logos/app_logo_primary.svg'),
              width: 90,
              height: 90),
          const SizedBox(height: 20),

          // sub-title
          UITextView(
            text: "Let's get you login !",
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // list view -> holds the login form widgets
          Expanded(
            child: ListView(
              children: <Widget>[
                Form(
                  key: loginForm,
                  child: Column(
                    children: <Widget>[
                      // email field
                      UITextField(
                        controller: emailController,
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                        },
                      ),
                      const UISpacer(
                        space: Constants.smallSpace,
                      ),

                      // password
                      UITextField(
                        controller: passwordController,
                        labelText: "Password",
                        obsecureText: true,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                        },
                      ),

                      // reset password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          UITextButton(
                            onPress: () {},
                            labelText: "Forgot password ?",
                            textColor: DeviceUtils.isDarkmode(context) == false
                                ? AppColors.primary
                                : AppColors.white,
                          ),
                        ],
                      ),

                      const UISpacer(
                        space: Constants.mediumSpace,
                      ),

                      UIElevatedButton(
                        label: "Login",
                        onPress: () {
                          if (loginForm.currentState!.validate()) {
                            handleAuthentication(SignIn(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                      ),

                      const UISpacer(space: Constants.mediumSpace),

                      const UITextView(text: 'or'),

                      const UISpacer(space: Constants.mediumSpace),

                      // register
                      GestureDetector(
                        onTap: () {
                          print("clicked on create an account");
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "Don't have an account ?",
                                style: TextStyle(
                                    color:
                                        DeviceUtils.isDarkmode(context) == true
                                            ? AppColors.white
                                            : AppColors.textPrimary),
                                children: const <TextSpan>[
                              TextSpan(text: " "),
                              TextSpan(
                                  text: "Create an account",
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold)),
                            ])),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],

        // loadin
      ));
    });
  }
}
