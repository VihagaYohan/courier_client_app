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
        children: ListView());
  }
}
