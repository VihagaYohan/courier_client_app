import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class SenderForm extends StatefulWidget {
  int? selectedPacakgeType = 1;
  SenderForm({super.key});

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

    List<PackageSize> packageSize = [
      PackageSize(
          index: 1,
          icon: smallPackageIcon(
            context,
          ),
          text: "< 1 KG"),
      PackageSize(
          index: 2, icon: mediumPackageIcon(context), text: "3 KG - 10 KG"),
      PackageSize(index: 3, icon: largePackageIcon(context), text: "> 10 KG")
    ];

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
                for (var item in packageSize) packageSizeType(context, item)
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

// package size item
  Widget packageSizeType(BuildContext context, PackageSize item) {
    bool isDarkmode = DeviceUtils.isDarkmode(context);
    double boxWidth = (DeviceUtils.getScreenWidth(context) -
            (Constants.mediumSpace * 2) -
            50) /
        3;
    return GestureDetector(
      onTap: () {
        print(item.index);
        setState(() {
          widget.selectedPacakgeType = item.index;
        });
      },
      child: Container(
        width: boxWidth,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.grey),
            borderRadius: BorderRadius.circular(Constants.smallSpace),
            color: isDarkmode == true ? AppColors.dark : null),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              item.icon,
              const SizedBox(height: Constants.smallSpace / 2),
              UITextView(
                text: item.text,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }

  // cube icon widget
  Widget packageSizeItemIcon(
    BuildContext context,
  ) {
    Color iconColor =
        widget.selectedPacakgeType == 2 ? AppColors.primary : AppColors.grey;
    return UIIcon(iconData: CupertinoIcons.cube_box, iconColor: iconColor);
  }

  // small-icon
  Widget smallPackageIcon(BuildContext context) {
    return packageSizeItemIcon(context);
  }

  // medium-icon
  Widget mediumPackageIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        packageSizeItemIcon(context),
        packageSizeItemIcon(context)
      ],
    );
  }

  // large-icon
  Widget largePackageIcon(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        packageSizeItemIcon(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            packageSizeItemIcon(context),
            packageSizeItemIcon(context)
          ],
        )
      ],
    );
  }
}

class PackageSize {
  final int index;
  final Widget icon;
  final String text;

  PackageSize({required this.index, required this.icon, required this.text});
}
