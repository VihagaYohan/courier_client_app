import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        children: Center(
      child: UITextView(text: "Order list screen"),
    ));
  }
}
