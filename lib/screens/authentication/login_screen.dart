import 'package:courier_client_app/utils/colors.dart';
import 'package:courier_client_app/utils/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// services
import 'package:courier_client_app/services/service.dart';

// models
import 'package:courier_client_app/models/UserInfo.dart' as UserInfoData;

// utils
import 'package:courier_client_app/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // handle user google sign-in
  Future<void> handleAuthentication({required BuildContext context}) async {
    try {
      // await Authentication.signOut();
      UserCredential user = await Authentication.signInWithGoogle();

      String name = user.additionalUserInfo?.profile!['name'] as String;
      String email = user.additionalUserInfo?.profile!['email'] as String;
      String photoUrl = user.additionalUserInfo?.profile!['picture'] as String;

      UserInfoData.UserInfo userData =
          UserInfoData.UserInfo(name: name, email: email, photoUrl: photoUrl);
      print(userData.toJson());

      // mark user already logged into to app in shared preferences
      Helper.setData<bool>(Constants.isLoggedIn, true);

      // save user data to shared preferences
      Helper.setData<String>(Constants.user, userData.toJson().toString());

      // UserInfo userData = UserInfo(name)

      /* Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContactDataScreen(
                userData: user,
              ))); */
    } catch (e) {
      print('Error - ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final loginForm = GlobalKey<FormState>();

    return UIContainer(
        children: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 50),
        const Image(
            image: Svg('assets/images/logos/app_logo_primary.svg'),
            width: 90,
            height: 90),
        const SizedBox(height: 20),
        UITextView(
          text: "Let's get you login !",
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Form(
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
                    if (loginForm.currentState!.validate()) {}
                  },
                ),

                const UISpacer(space: Constants.mediumSpace),

                const UITextView(text: 'or'),

                // register
                GestureDetector(
                  onTap: () {
                    print("clicked on create an account");
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an account ?",
                          style: TextStyle(
                              color: DeviceUtils.isDarkmode(context) == true
                                  ? AppColors.white
                                  : AppColors.textPrimary),
                          children: const <TextSpan>[
                        TextSpan(text: " "),
                        TextSpan(
                            text: "Create an account",
                            style: TextStyle(
                              color: AppColors.primary,
                            )),
                      ])),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
