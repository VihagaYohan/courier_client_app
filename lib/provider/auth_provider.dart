import 'package:flutter/cupertino.dart';

// models
import 'package:courier_client_app/models/models.dart';

// service
import 'package:courier_client_app/services/service.dart';

class AuthProvider extends ChangeNotifier {
  Authentication authService = Authentication();
  bool loading = false;
  String error = '';
  UserInfo? user;

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
    error = '';
    notifyListeners();
  }

  userSignIn(SignIn payload) async {
    try {
      setLoading(true);

      final response = await Authentication.signInUser(payload);
      final statusCode = response['statusCode'];

      if (statusCode == 200) {
        final userData = response['data']['user'];
        final tokenData = response['data']['token'];

        onSuccess();

        user = UserInfo(
            id: userData['_id'],
            name: userData['name'],
            email: userData['email'],
            phoneNumber: userData['phoneNumber'],
            role: userData['role'],
            createdOn: userData['createdOn'],
            token: tokenData);
        return user;
      } else {
        setError("Invalid email or password");
      }
    } catch (e) {
      setError("Error occured while signin");
    }
    setLoading(false);
  }

/*   bool loading = false;
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

      print(statusCode);
      if (statusCode == 200) {
        final userData = response['data']['user'];
        final tokenData = response['data']['token'];

        /*  loading = false;
        error = false;
        notifyListeners(); */

        user = UserInfo(
            id: userData['_id'],
            name: userData['name'],
            email: userData['email'],
            phoneNumber: userData['phoneNumber'],
            role: userData['role'],
            createdOn: userData['createdOn'],
            token: tokenData);
        return user;
      } else {
        loading = false;
        error = true;
        message = "Invalid email or password";
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      error = true;
      message = "$e";
      notifyListeners();
    }
    loading = false;
    error = false;
    message = "";
    notifyListeners();
  } */
}
