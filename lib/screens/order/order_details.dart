import 'dart:convert';

import 'package:flutter/material.dart';
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
  late IO.Socket socket;
  /*  final channel = WebSocketChannel.connect(
    Uri.parse(''),
  ); */

  @override
  void initState() {
    super.initState();
    connect();
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
    return const UIContainer(
        showAppBar: true,
        appbar: UIAppBar(title: "Order Details"),
        children: Column(
          children: [
            UITextView(text: "Order details screen"),
            // UITextView(text: orderde)

            /* StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  UITextView(
                      text:
                          snapshot.hasData ? '${snapshot.data}' : 'No data yet')
                ],
              );
            }) */
          ],
        ));
  }
}
