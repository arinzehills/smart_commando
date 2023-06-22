import 'dart:convert';

IsNewUserModel chatModelFromJson(String str) =>
    IsNewUserModel.fromJson(json.decode(str));

String chatModelToJson(IsNewUserModel data) => json.encode(data.toJson());

class IsNewUserModel {
  IsNewUserModel(
      {required this.id,
      required this.username,
      required this.newlyRegistered,
      this.message,
      required this.regAt});

  String? id;
  String? username;
  bool? newlyRegistered;
  String? regAt;
  String? message;

  factory IsNewUserModel.fromJson(Map<String, dynamic> json) => IsNewUserModel(
        id: json["id"],
        username: json["username"],
        newlyRegistered: json["newlyRegistered"],
        regAt: json["regAt"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "newlyRegistered": newlyRegistered,
        "regAt": regAt,
        "message": message,
      };
}
