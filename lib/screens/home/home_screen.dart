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
            recentDelivery(context),
            servicesItem(context)
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
        // recent delivery title and view all text button
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
        ),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              vertical: Constants.largeSpace,
              horizontal: Constants.mediumSpace),
          decoration: BoxDecoration(
              color: AppColors.softGrey,
              borderRadius: BorderRadius.circular(Constants.smallSpace)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.only(right: Constants.mediumSpace),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const UIIcon(
                      iconData: CupertinoIcons.cube_box,
                      iconColor: AppColors.black,
                      size: 24,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UITextView(
                        text: "Macbook Air M2 (Space Gray)",
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                      ),
                      UITextView(
                        text: "Tracking ID: 374884",
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 10),
              // horizontal line
              const Divider(
                color: AppColors.darkGrey,
                thickness: 1,
              ),

              const SizedBox(height: 10),

              // recent location
              location(context)
            ],
          ),
        )
      ],
    );
  }

  // source and destination
  Widget location(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        recentItemLocationRow(
            context, Icons.location_city, "From", "GenexT, Colombo"),
        const SizedBox(
          height: 50,
          child: VerticalDivider(
            thickness: 1.2,
            width: 10,
          ),
        ),
        recentItemLocationRow(
            context, Icons.location_pin, "To", "1A, Waragoda Rd, Kelaniya")
      ],
    );
  }

  // recent item row
  Widget recentItemLocationRow(
      BuildContext context, IconData icon, String title, String subTitle) {
    return Row(
      children: <Widget>[
        Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primary)),
        const SizedBox(width: Constants.mediumSpace),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UITextView(
              text: title,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            UITextView(
              text: subTitle,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }

  // services

  // service item
  Widget servicesItem(BuildContext context) {
    double width = DeviceUtils.getScreenWidth(context) -
        40; // 40 is the default value for left and right padding in UIContainer widget
    double boxWidth = (width - 20) / 2;

    print('width - ${width}');
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            width: boxWidth,
            padding:
                const EdgeInsets.symmetric(vertical: Constants.mediumSpace),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(Constants.smallSpace)),
            child: const Center(
              child: Column(
                children: [
                  UIIcon(
                    iconData: Icons.fire_truck,
                    iconColor: AppColors.primary,
                  ),
                  SizedBox(
                    height: Constants.mediumSpace,
                  ),
                  UITextView(text: "Courier")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
