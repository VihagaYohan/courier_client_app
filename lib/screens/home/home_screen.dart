import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        paddingTop: Constants.mediumSpace,
        children: ListView(
          children: <Widget>[
            UIProfileBar(),
            trackCard(context),
            recentDelivery(context)
          ],
        ));
  }

  Widget trackCard(BuildContext context) {
    final TextEditingController trackingNumberController =
        TextEditingController();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: Constants.largeSpace),
      padding: const EdgeInsets.symmetric(vertical: Constants.mediumSpace / 2),
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Constants.smallSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UITextView(
              text: "Track your package",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
            ),
            const SizedBox(height: 10),
            UITextView(
              text: "Please enter your tracking number",
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
            ),

            const SizedBox(
              height: Constants.mediumSpace,
            ),
            // search tracking number field and search button
            SizedBox(width: double.infinity, child: searchField(context)),

            // recent delivery
          ],
        ),
      ),
    );
  }

  Widget searchField(BuildContext context) {
    final TextEditingController trackingNumberController =
        TextEditingController();

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: trackingNumberController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Tracking number",
                hintStyle: TextStyle(
                    color: AppColors.darkGrey.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
                prefixIcon:
                    const Icon(CupertinoIcons.cube_box, color: AppColors.black),
                filled: true,
                fillColor: AppColors.white),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary),
          child: IconButton(
              color: AppColors.white,
              onPressed: () {
                print('hello');
              },
              icon: const UIIcon(
                iconData: Icons.search,
                iconColor: AppColors.white,
              )),
        )
      ],
    );
  }

  Widget recentDelivery(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UITextView(
              text: "Recent Delivery",
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            UITextButton(onPress: () {}, labelText: "View All")
          ],
        )
      ],
    );
  }
}
