// import 'dart:js_interop';

import 'package:http/http.dart' as http;
// model
import 'dart:convert';
import 'package:courier_client_app/models/CourierType.dart';
import 'package:courier_client_app/models/PackageType.dart';
// import 'package:courier_client_app/models/models.dart';

// endpoints
import 'package:courier_client_app/services/endpoints.dart';

class HelperService {
  // get all shipment types
  static getShipmentTypes() async {
    try {
      List<CourierType> courierTypes = [];
      final response = await http.get(Uri.parse(Endpoints.courierTypes));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (var eachItem in jsonData['data']) {
          final courierType = CourierType(
              id: eachItem['_id'],
              name: eachItem['name'],
              createdAt: eachItem['createdAt']);

          courierTypes.add(courierType);
        }
        return courierTypes;
      } else {
        throw Exception('Failed to load shipment types');
      }
    } catch (e) {
      throw Exception('Failed to load shipment types $e');
    }
  }

  // get all package types
  static getPackageTypes() async {
    try {
      List<PackageType> packageTypes = [];
      final response = await http.get(Uri.parse(Endpoints.packageTypes));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (var item in jsonData['data']) {
          final packageType = PackageType(
              id: item['_id'],
              name: item['name'],
              createdAt: item['createdAt']);
          packageTypes.add(packageType);
        }
        return packageTypes;
      } else {
        throw Exception('Failed to load package types');
      }
    } catch (e) {
      throw Exception('Failed to load package types $e');
    }
  }
}
