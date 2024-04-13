import 'package:courier_client_app/services/service.dart';
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// models
import "package:courier_client_app/models/models.dart";

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// providers
import 'package:courier_client_app/provider/providers.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.isLoading == true) {
          return const UIProgressIndicator();
        } else if (orderProvider.isLoading == false &&
            orderProvider.errorMessage.isNotEmpty) {
          return Center(child: UITextView(text: orderProvider.errorMessage));
        } else {
          return UIContainer(
              children: ListView.builder(
                  itemCount: orderProvider.orderList.length,
                  itemBuilder: (context, index) {
                    return orderItem(context, orderProvider.orderList[index]);
                  }));
        }
      },
    );
  }

  // order item
  Widget orderItem(BuildContext context, OrderResponse item) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: Constants.smallSpace, horizontal: Constants.mediumSpace),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.dark),
            borderRadius: BorderRadius.circular(Constants.borderRadius)),
        child: const Column(
          children: <Widget>[
            // tracking number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[UITextView(text: "Tracking ID")],
            )
          ],
        ),
      ),
    );
  }
}
