import 'package:courier_client_app/services/service.dart';
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// providers
import 'package:courier_client_app/provider/providers.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    super.initState();
/*     Provider.of<OrderProvider>(context, listen: false)
        .getAllOrders()
        .then((value) {
      print(value);
    }).catchError((e) {
      print('Error fetching order: $e');
    }); */

    fetchOrders();
  }

  void fetchOrders() async {
    try {
      final response = await OrderService.getListOfOrders();
      print(response);
    } catch (e) {
      print('Error occured : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);

    return provider.isLoading == true
        ? const UIProgressIndicator()
        : UIContainer(
            children: Center(
            child: UITextView(text: "Order list screen"),
          ));

    /*  return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.isLoading == true) {
          return const UIProgressIndicator();
        } else {
          return const UIContainer(
              children: Center(
            child: UITextView(text: 'Order list screen'),
          ));
        }
      },
    ); */
  }
}
