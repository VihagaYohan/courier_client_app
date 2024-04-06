import 'package:http/http.dart' as http;
import 'dart:convert';

// model
import 'package:courier_client_app/models/models.dart';

// endpoints
import 'package:courier_client_app/services/endpoints.dart';

class OrderService {
  // create new courier order
  static createOrder(Order payload) async {
    try {
      final response = await http.post(Uri.parse(Endpoints.order),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(payload.toJson()));

      return response;
    } catch (e) {
      print('Error at creating new order $e');
    }
  }
}
