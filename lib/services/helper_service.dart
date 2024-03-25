import 'package:http/http.dart' as http;
// model
import 'dart:convert';
import 'package:courier_client_app/models/CourierType.dart';
import 'package:courier_client_app/models/models.dart';

// endpoints
import 'package:courier_client_app/services/endpoints.dart';

class HelperService {
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
        print("object");
        print(courierTypes.runtimeType);
        return courierTypes;
      } else {
        throw Exception('Failed to load shipment types');
      }
    } catch (e) {
      throw Exception('Failed to load shipment types $e');
    }
  }
}
