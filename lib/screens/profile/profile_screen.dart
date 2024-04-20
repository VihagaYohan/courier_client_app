import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// model
import 'package:courier_client_app/models/models.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// providers
import 'package:courier_client_app/provider/providers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getCurrentUser();
  }

  // fetch profile data
  Future<void> getCurrentUser() async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        print(1);
        if (profileProvider.isLoading == true) {
          return const UIProgressIndicator();
        } else if (profileProvider.isLoading == false &&
            profileProvider.errorMessage.isNotEmpty) {
          return Center(
            child: UITextView(text: profileProvider.errorMessage),
          );
        } else {
          return ListView(
            children: <Widget>[
              const UISpacer(
                space: Constants.largeSpace,
              ),
              UIAvatar(name: profileProvider.currentUser.name),
              const UISpacer(
                space: Constants.mediumSpace,
              ),
              UITextView(text: profileProvider.currentUser.name)
            ],
          );
        }
      },
    );

    /* final provider = Provider.of<ProfileProvider>(context);

    if (provider.isLoading) {
      return const UIProgressIndicator();
    } else if (provider.isLoading == false &&
        provider.errorMessage.isNotEmpty) {
      return Center(child: UITextView(text: provider.errorMessage));
    } else {
      return UIContainer(
          children: ListView(
        children: <Widget>[
          const UISpacer(
            space: Constants.mediumSpace,
          ),
          UITextView(text: "")
        ],
      ));
    } */
  }
}
