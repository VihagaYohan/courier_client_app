import 'package:flutter/material.dart';

// models
import 'package:courier_client_app/models/models.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.orderDetail});
  final OrderResponse orderDetail;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const UIContainer(
        children: Center(
      child: UITextView(text: "Order details screen"),
    ));
  }
}
