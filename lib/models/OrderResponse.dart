// models
import 'package:courier_client_app/models/models.dart';

class OrderResponse {
  final String id;
  final String statusId;
  final String courierTypeId;
  final String packageTypeId;
  final String packageSize;
  final SenderDetailsResponse senderDetails;
  final ReceiverDetailsResponse receiverDetails;
  final double orderTotal;
  final String paymentType;
  final String createdOn;

  OrderResponse(
      {required this.id,
      required this.statusId,
      required this.courierTypeId,
      required this.packageTypeId,
      required this.packageSize,
      required this.senderDetails,
      required this.receiverDetails,
      required this.orderTotal,
      required this.paymentType,
      required this.createdOn});

  // serialize Order reponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'statusId': statusId,
      'courierTypeId': courierTypeId,
      'packageTypeId': packageTypeId,
      'packageSize': packageSize,
      'senderDetails': senderDetails,
      'receiverDetails': receiverDetails,
      'orderTotal': orderTotal,
      'paymentType': paymentType,
      'createdOn': createdOn
    };
  }

  // create order response object from JSON
  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
        id: json['id'],
        statusId: json['statusId'],
        courierTypeId: json['courierTypeId'],
        packageTypeId: json['packageTypeId'],
        packageSize: json['packageSize'],
        senderDetails: json['senderDetails'],
        receiverDetails: json['receiverDetails'],
        orderTotal: json['orderTotal'],
        paymentType: json['paymentType'],
        createdOn: json['createdOn']);
  }
}
