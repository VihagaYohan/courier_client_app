class UserInfo {
  final int? id;
  final String name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? photoUrl;

  UserInfo({
    this.id,
    required this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.photoUrl,
  });

  factory UserInfo.fromSqlfliteDatabase(Map<String, dynamic> map) => UserInfo(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '');
}
