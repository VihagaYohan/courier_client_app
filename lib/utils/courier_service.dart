// constants
import 'package:courier_client_app/utils/utils.dart';

class CourierService {
  static double calculateCourierCharge(
      String courierType, String packageType, String packageSize) {
    double baseCharge = 100;
    double sizeMultiplier = 1.0;
    double typeMultiplier = 1.0;

    // base charges
    switch (courierType) {
      case Constants.express:
        baseCharge = 200;
        break;
      case Constants.standard:
        baseCharge = 100;
        break;
      case Constants.custom:
        baseCharge = 100;
        break;
      default:
        baseCharge = 100;
        break;
    }

    // package size
    switch (packageSize) {
      case Constants.smallPackage:
        sizeMultiplier = 1.0;
        break;
      case Constants.mediumPackage:
        sizeMultiplier = 2.0;
        break;
      case Constants.largePackage:
        sizeMultiplier = 3.0;
        break;
    }

    // package type
    switch (packageType) {
      case Constants.smallPackage:
        typeMultiplier = 1.0;
        break;
      case Constants.mediumPackage:
        typeMultiplier = 2.0;
        break;
      case Constants.largePackage:
        typeMultiplier = 3.0;
        break;
    }

    // calculate total courier package total
    double total = baseCharge * sizeMultiplier * typeMultiplier;
    return total;
  }
}
