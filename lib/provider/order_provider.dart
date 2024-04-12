// models
import 'dart:convert';
import 'package:flutter/material.dart';

// models
import 'package:courier_client_app/models/models.dart';

// services
import 'package:courier_client_app/services/service.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class OrderProvider extends ChangeNotifier {
  bool loading = false;
  String error = "";
  OrderRequest? order;

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
  createOrder(OrderRequest payload) async {
    try {
      setLoading(true);
      final response = await OrderService.createOrder(payload);
      if (response == 200) {
        onSuccess();
        return true;
      } else {
        setError("Unable to create courier order");
        return false;
      }
    } catch (e) {
      setError("Error occured while creating the order");
    }
    setLoading(false);
  }

  // get list of orders
  getAllOrders() async {
    try {
      setLoading(true);
      // get current user id
      final userId = await Helper.getData(Constants.user);
      // print('user data goes here');
      // print(userId);
      final respone = await OrderService.getListOfOrders();
    } catch (e) {
      setError("Error occured while fetching all orders");
    }
    setLoading(false);
  }
}
