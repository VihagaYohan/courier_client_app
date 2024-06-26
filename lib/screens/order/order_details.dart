import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:socket_io_client/socket_io_client.dart' as IO;

// models
import 'package:courier_client_app/models/models.dart';

// widget
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.orderDetail});
  final OrderResponse orderDetail;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int index = 0;
  late IO.Socket socket;
  /*  final channel = WebSocketChannel.connect(
    Uri.parse(''),
  ); */

  @override
  void initState() {
    super.initState();
    connect();
  }

  continueStep() {
    if (index < 2) {
      setState(() {
        index += 1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      index = value;
    });
  }

  void connect() {
    socket = IO.io(Constants.server_URL, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    try {
      socket.connect();
      socket.onConnect((data) => {print('connected')});
      // send data to socket server
      // socket.emit('/test', 'hello, world');
      socket.on('message', (data) => print(data));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        showAppBar: true,
        appbar: const UIAppBar(title: ""),
        children: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // tracking number
            UITextView(
              text: 'Tracking # - ${widget.orderDetail.trackingId}',
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),

            const UISpacer(
              space: Constants.mediumSpace,
            ),

            // courier type, date and time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // courier type
                    UITextView(
                      text: "${widget.orderDetail.courierType.name} delievery",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),

                    // status
                    UITextView(
                      text: "Type : ${widget.orderDetail.packageType.name}",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                // date and time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    UITextView(
                      text: AppFormatter.formatDate(DateTime.parse(
                          widget.orderDetail.senderDetails.pickUpDate)),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    UITextView(
                      text: widget.orderDetail.senderDetails.pickUpTime,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),

            const UISpacer(
              space: Constants.mediumSpace,
            ),

            const UIHeader(
              title: "Order Details",
            ),

            // from and to address
            UILocation(
                from: widget.orderDetail.senderDetails.address,
                to: widget.orderDetail.receiverDetails.address),

            const UISpacer(
              space: Constants.mediumSpace,
            ),

            const UIHeader(title: "Cost"),
            // total cost
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const UITextView(text: "Estimated cost"),
                    UITextView(
                        text: Helper.currencyFormat(
                            widget.orderDetail.orderTotal))
                  ],
                )
              ],
            ),

            const UISpacer(
              space: Constants.mediumSpace,
            ),

            // track order
            if (widget.orderDetail.status.name == Constants.outForDelivery)
              UIElevatedButton(
                label: 'Track',
                onPress: () {},
                isPrimary: false,
                showSuffixIcon: true,
                suffixIcon: const UIIcon(
                  iconData: Icons.track_changes,
                  iconColor: AppColors.primary,
                ),
              )
          ],
        ));
  }
}
