import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// feature
import 'package:courier_client_app/screens/order/feature/feature.dart';

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
            SenderForm(),
            const SizedBox(height: Constants.mediumSpace),
            /*  Positioned(
                bottom: 10,
                left: 20,
                child: UIElevatedButton(label: "Next", onPress: () {})) */
          ],
        ));
  }
}
