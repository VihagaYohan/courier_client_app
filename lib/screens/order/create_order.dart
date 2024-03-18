import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        showAppBar: true,
        appbar: const UIAppBar(
          title: "Send Package",
        ),
        children: ListView(
          children: <Widget>[
            UITextView(
              text: 'Shipment type',
              textAlign: TextAlign.left,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const UIDropDown(),
            const SizedBox(height: Constants.mediumSpace),
            const UITextView(
              text: "Sender Details",
              textAlign: TextAlign.left,
            )
          ],
        ));
  }
}
