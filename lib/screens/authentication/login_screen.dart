import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:courier_client_app/screens/profile/profile_screen.dart';
import 'package:courier_client_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// services
import 'package:courier_client_app/services/service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // handle user google sign-in
  Future<void> handleAuthentication({required BuildContext context}) async {
    try {
      // await Authentication.signOut();
      UserCredential user = await Authentication.signInWithGoogle();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(
                userData: user,
              )));
    } catch (e) {
      print('Error - ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        UITextView(
          text:
              "No need to fill forms, login with your google account and enjoy all the services.",
          textAlign: TextAlign.left,
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.textPrimary, fontSize: 14),
        ),
        const SizedBox(height: 50),
        UIElevatedButton(
          label: "Login With Google",
          onPress: () {
            handleAuthentication(context: context);
            // navigate to profile data screen
            /* Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen())); */
          },
          isPrimary: false,
          showSuffixIcon: true,
        )
      ],
    ));
  }
}
