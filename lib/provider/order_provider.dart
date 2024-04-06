// models
import 'package:courier_client_app/models/models.dart';

// services
import 'package:courier_client_app/services/service.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  bool loading = false;
  String error = "";
  Order? order;

  bool get isLoading => loading;
  String get errorMessage => error;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void setError(String value) {
    loading = false;
    error = value;
    notifyListeners();
  }

  void onSuccess() {
    loading = false;
    error = "";
    notifyListeners();
  }

  // create order
  createOrder(Order payload) async {
    try {
      setLoading(true);

      final response = await OrderService.createOrder(payload);
      final statusCode = response['statusCode'];

      onSuccess();
    } catch (e) {
      setError("Error occured while creating the order");
    }
    setLoading(false);
  }
}
