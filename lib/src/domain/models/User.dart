import 'package:indriver_clone_flutter/src/domain/models/Role.dart';

class User {
  int? id;
  String name;
  String lastname;
  String email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        notificationToken: json["notification_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "image": image,
        "notification_token": notificationToken,
        "roles": roles != null
            ? List<dynamic>.from(roles!.map((x) => x.toJson()))
            : [],
      };
}
