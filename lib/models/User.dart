/* class User {
  final String name;
  final String email;
  final String? photoUrl;
  final String? phoneNumber;

  User({
    required this.name,
    required this.email,
    this.photoUrl,
    this.phoneNumber,
  });
}
 */

import 'dart:ffi';

class User {
  final String id;
  final UserInfo userInfo;
  final UserCredential userCredential;
  final UserProfile user;

  User(
      {required this.id,
      required this.userInfo,
      required this.userCredential,
      required this.user});
}

class UserInfo {
  final bool isNewUser;
  final Map<String, dynamic>? profile;
  final String? providerId;
  final String? username;
  final String? authorizationCode;

  UserInfo(
      {required this.isNewUser,
      this.profile,
      this.providerId,
      this.username,
      this.authorizationCode});
}

class UserCredential {
  final String providerId;
  final String signInMethod;
  final int? token;
  final String? accessToken;

  UserCredential(
      {required this.providerId,
      required this.signInMethod,
      this.token,
      this.accessToken});
}

class UserProfile {
  final String? displayName;
  final String? email;
  final String? phoneNumber;

  UserProfile({this.displayName, this.email, this.phoneNumber});
}
