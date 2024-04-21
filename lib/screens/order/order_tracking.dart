import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

// models
import 'package:courier_client_app/models/models.dart';

class OrderTracking extends StatefulWidget {
  final OrderResponse orderDetail;

  const OrderTracking({super.key, required this.orderDetail});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return const UIContainer(
        showAppBar: true,
        appbar: UIAppBar(title: "Order Tracking"),
        children: const Placeholder());
  }
}
