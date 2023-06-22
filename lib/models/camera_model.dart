class Camera {
  // final String role;

  final String id;
  final String rstp_url;
  // final String email;

  String? token;

  Camera({
    required this.id,
    required this.rstp_url,
    // required this.email,
    this.token,
  });
  static Camera fromJson(Map<String, dynamic> json) => Camera(
        id: json['_id'],
        rstp_url: json['rstp_url'],
        // email: json['email'],
      );
  Map<String, Object?> toJson() => {
        // 'id': id,
        'rstp_url': rstp_url,
        // 'email': email,
      };
}
