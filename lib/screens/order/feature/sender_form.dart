import 'dart:convert';
import 'dart:ffi';

import 'package:courier_client_app/models/CourierType.dart';
import 'package:courier_client_app/models/PackageType.dart';
import 'package:courier_client_app/screens/order/feature/receiver_form.dart';
import 'package:courier_client_app/services/helper_service.dart';
import 'package:courier_client_app/utils/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';
import 'package:flutter/widgets.dart';

// models
import 'package:courier_client_app/models/models.dart';

// Getx state-mangement
import 'package:courier_client_app/global_state/global_state.dart';
import 'package:get/instance_manager.dart';

class SenderForm extends StatefulWidget {
  int? selectedPacakgeType = 1;
  List<CourierType> courierTypes = [];
  List<PackageType> packageTypes = [];
  String? shipmentType;
  String? packageType;

  SenderForm({super.key, this.shipmentType});

  @override
  State<SenderForm> createState() => _SenderFormState();
}

class _SenderFormState extends State<SenderForm> {
  final senderForm = GlobalKey<FormState>();
  final GlobalState c = Get.put(GlobalState());

  @override
  void initState() {
    super.initState();
    fetchCourierTypes();
    fetchPackageTypes();
  }

  // fetch courier types / shipment types
  void fetchCourierTypes() async {
    try {
      var res = await HelperService.getShipmentTypes();
      setState(() {
        widget.courierTypes = res;
      });
    } catch (e) {
      print(e);
    }
  }

  // fetch all package types
  void fetchPackageTypes() async {
    try {
      var res = await HelperService.getPackageTypes();
      setState(() {
        widget.packageTypes = res;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController datePickerController = TextEditingController();
    final TextEditingController timePickerController = TextEditingController();
    final TextEditingController senderNotesController = TextEditingController();
    final TextEditingController shipmentTypeController =
        TextEditingController();

    Brightness brightness = MediaQuery.of(context).platformBrightness;

    // package size list
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
            // shipment type
            UIDropDown(
              placeholderText: 'Select type',
              optionList: widget.courierTypes,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select shipment type";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  widget.shipmentType = value;
                });
              },
            ),

            const UIHeader(
              title: "Sender Details",
            ),

            // sender name
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

            // phone number
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

            // email
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

            // pick-up date
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select pick-up date";
                }
                return null;
              },
            ),
            const UISpacer(),

            // pick-up time
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select pick-up time";
                  }
                }),
            const UIHeader(title: "Package Size"),

            // package size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                for (var item in packageSize) packageSizeType(context, item)
              ],
            ),
            const UIHeader(title: "Package Type"),

            // package type type
            UIDropDown(
              placeholderText: 'Select package type',
              optionList: widget.packageTypes,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select courier type";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  widget.packageType = value;
                });
              },
            ),

            const SizedBox(height: Constants.mediumSpace),

            // sender notes
            SizedBox(
              // height: 200,
              child: UITextField(
                controller: senderNotesController,
                labelText: "Notes",
                maxLines: null,
                expands: false,
              ),
            ),
            const SizedBox(height: Constants.mediumSpace),
            UIElevatedButton(
                label: "Next",
                onPress: () {
                  if (senderForm.currentState!.validate()) {
                  } else {
                    SenderDetails senderDetails = SenderDetails(
                        senderId: '65e2d6b2536f159e3b84f27a',
                        // name: senderNotesController.text,
                        // email: emailController.text,
                        name: 'Vihanga Yohan',
                        email: 'vihagayohan94@gmail.com',
                        pickUpDate: datePickerController.text,
                        pickUpTime: timePickerController.text,
                        // mobileNumber: phoneNumberController.text,
                        mobileNumber: '0716995328',
                        address:
                            'No.21/2 Bodhirukkarama Road, Galboralla, Kelaniya',
                        senderNotes: senderNotesController.text);

                    Order orderObj = Order(
                        statusId: '65e33579c502128c30a094c1',
                        // courierTypeId: widget.shipmentType.toString(),
                        // packageTypeId: widget.packageType.toString(),
                        courierTypeId: '65df3456d1bb363d65c35968',
                        packageTypeId: '65df3495d1bb363d65c3596a',
                        packageSize: 'small',
                        senderDetails: senderDetails);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ReceiverForm(orderDetails: orderObj)));
                  }
                })
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
        setState(() {
          widget.selectedPacakgeType = item.index;
        });
      },
      child: Container(
        width: boxWidth,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: widget.selectedPacakgeType == item.index
                    ? AppColors.primary
                    : AppColors.grey),
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
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: widget.selectedPacakgeType == item.index
                        ? AppColors.primary
                        : isDarkmode == true
                            ? AppColors.grey
                            : AppColors.dark),
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
    int option,
  ) {
    bool isDarkmode = DeviceUtils.isDarkmode(context);
    Color iconColor = widget.selectedPacakgeType == option
        ? AppColors.primary
        : isDarkmode == true
            ? AppColors.grey
            : AppColors.dark;
    return UIIcon(iconData: CupertinoIcons.cube_box, iconColor: iconColor);
  }

  // small-icon
  Widget smallPackageIcon(BuildContext context) {
    int option = 1;
    return packageSizeItemIcon(context, option);
  }

  // medium-icon
  Widget mediumPackageIcon(BuildContext context) {
    int option = 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        packageSizeItemIcon(context, 2),
        packageSizeItemIcon(context, 2)
      ],
    );
  }

  // large-icon
  Widget largePackageIcon(BuildContext context) {
    int option = 3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        packageSizeItemIcon(context, 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            packageSizeItemIcon(context, 3),
            packageSizeItemIcon(context, 3)
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
