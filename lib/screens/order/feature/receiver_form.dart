import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// components
import 'package:courier_client_app/widgets/widgets.dart';

// Getx state-mangement
import 'package:courier_client_app/global_state/global_state.dart';
import 'package:get/instance_manager.dart';

class ReceiverForm extends StatefulWidget {
  const ReceiverForm({super.key});

  @override
  State<ReceiverForm> createState() => _ReceiverFormState();
}

class _ReceiverFormState extends State<ReceiverForm> {
  final receiverForm = GlobalKey<FormState>();
  final GlobalState globalState = Get.put(GlobalState());

  @override
  Widget build(BuildContext context) {
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
          UIElevatedButton(label: 'Done', onPress: () {})
        ],
      ),
    );
  }
}
