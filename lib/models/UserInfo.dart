class UserInfo {
  final String name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? photoUrl;

  UserInfo({
    required this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.photoUrl,
  });

  // serilize UserInfo object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl
    };
  }

  // deserialize UserInfo object from Map
  factory UserInfo.fromJson(Map<String, dynamic> map) => UserInfo(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '');
}
