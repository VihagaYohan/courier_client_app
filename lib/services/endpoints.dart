import 'package:courier_client_app/utils/utils.dart';

enum Environment { development, production }

class Endpoints {
  static Environment currentEnvionment = Environment.development;

  static void setEnvironment(Environment env) {
    currentEnvionment = env;
  }

  static String get baseUrl {
    switch (currentEnvionment) {
      case Environment.production:
        return Constants.production_URL;
      case Environment.development:
        return Constants.development_URL;
      default:
        return Constants.development_URL;
    }
  }

  // static properties for endpoints
  static String get courierTypes => '$baseUrl/courierTypes';
}
