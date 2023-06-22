class User {
  // final String role;

  final String id;
  final String full_name;
  final String email;
  final String? phone;
  final String? profilePicture;
  final String? password;
  String? token;

  User({
    required this.id,
    required this.full_name,
    required this.email,
    this.phone,
    this.profilePicture,
    this.password,
    this.token,
  });
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        full_name: json['full_name'],
        profilePicture: json['profilePicture'],
        email: json['email'],
        phone: json['phone'],
        token: json['token'],
      );
  Map<String, Object?> toJson() => {
        // 'id': id,
        'full_name': full_name,
        'email': email,
        'profilePicture': profilePicture,
        'password': password,
        'token': token,
      };
}
