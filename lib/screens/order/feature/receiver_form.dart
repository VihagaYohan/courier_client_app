import 'dart:convert';

import 'package:courier_client_app/utils/courier_service.dart';
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// components
import 'package:courier_client_app/widgets/widgets.dart';

// Getx state-mangement
import 'package:courier_client_app/global_state/global_state.dart';
import 'package:get/instance_manager.dart';

// models
import 'package:courier_client_app/models/models.dart';

// service
import 'package:courier_client_app/services/service.dart';

class ReceiverForm extends StatefulWidget {
  final Order orderDetails;

  const ReceiverForm({super.key, required this.orderDetails});

  @override
  State<ReceiverForm> createState() => _ReceiverFormState();
}

class _ReceiverFormState extends State<ReceiverForm> {
  final receiverForm = GlobalKey<FormState>();
  final GlobalState globalState = Get.put(GlobalState());

  // handle create order
  void handleCreateOrder(Order payload) async {
    try {
      final response = await OrderService.createOrder(payload);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('order details goes here');
    print(jsonEncode(widget.orderDetails));

    final TextEditingController receiverNameController =
        TextEditingController();
    final TextEditingController receiverMobileController =
        TextEditingController();
    final TextEditingController receiverAddressController =
        TextEditingController();
    final TextEditingController receiverNoteController =
        TextEditingController();

    return UIContainer(
      showAppBar: true,
      appbar: const UIAppBar(title: "Send Package"),
      children: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
              key: receiverForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const UIHeader(title: "Receiver Details"),
                  // receiver name
                  UITextField(
                    controller: receiverNameController,
                    labelText: "Enter name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                  ),

                  const UISpacer(),

                  // mobile number
                  UITextField(
                    controller: receiverMobileController,
                    labelText: "Enter mobile number",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter mobile number";
                      }
                      return null;
                    },
                  ),

                  const UISpacer(),

                  // address
                  UITextField(
                    controller: receiverAddressController,
                    labelText: "Enter address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter address";
                      }
                      return null;
                    },
                  ),

                  const UISpacer(),

                  // note
                  UITextField(
                    controller: receiverNoteController,
                    labelText: "Notes",
                    maxLines: null,
                    expands: false,
                  )
                ],
              )),
          UIElevatedButton(
              label: 'Done',
              onPress: () {
                if (receiverForm.currentState!.validate()) {
                  // calculate total cost
                  Future<double> total = CourierService.calculateCourierCharge(
                      //  "Express",
                      // "Document",
                      'small',
                      widget.orderDetails.courierTypeId,
                      widget.orderDetails.packageTypeId);

                  print('order total $total');

                  ReceiverDetails receiverDetails = ReceiverDetails(
                      name: receiverNameController.text,
                      mobileNumber: receiverMobileController.text,
                      address: receiverAddressController.text,
                      receiverNote: receiverNoteController.text);

                  Order orderPayload = Order(
                      courierTypeId: widget.orderDetails.courierTypeId,
                      packageTypeId: widget.orderDetails.packageTypeId,
                      packageSize: widget.orderDetails.packageSize,
                      senderDetails: widget.orderDetails.senderDetails,
                      receiverDetails: widget.orderDetails.receiverDetails,
                      orderTotal: 2000,
                      paymentType: widget.orderDetails.paymentType);
                  // handleCreateOrder(orderPayload);
                  print('order details');
                  print(orderPayload.toJson());
                }
              })
        ],
      ),
    );
  }
}
