import 'package:flutter/cupertino.dart';

// models
import 'package:courier_client_app/models/models.dart';

// service
import 'package:courier_client_app/services/service.dart';

class AuthProvider extends ChangeNotifier {
  Authentication authService = Authentication();
  bool loading = true;
  bool error = false;
  String message = "";
  UserInfo? user;

  // getter
  bool get isLoading => loading;
  bool get isError => error;
  String get messageTitle => message;

  // user login
  userSignIn(SignIn payload) async {
    try {
      loading = true;
      notifyListeners();

      final response = await Authentication.signInUser(payload);
      final statusCode = response['statusCode'];

      if (statusCode == 200) {
        final userData = response['data']['user'];
        final tokenData = response['data']['token'];

        user = UserInfo(
            id: userData['_id'],
            name: userData['name'],
            email: userData['email'],
            phoneNumber: userData['phoneNumber'],
            role: userData['role'],
            createdOn: userData['createdOn'],
            token: tokenData);

        loading = false;
        error = false;
      } else {
        loading = false;
        error = true;
        message = "Invalid email or password";
      }
    } catch (e) {
      loading = false;
      error = true;
      message = "$e";
    }
  }
}
