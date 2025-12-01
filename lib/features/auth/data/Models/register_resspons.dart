import 'package:ecommerce_app/features/auth/data/Models/User.dart';

class RegisterResspons {
  final String message;
  final User user;
  final String token;

  RegisterResspons(
      {required this.message, required this.user, required this.token});

  factory RegisterResspons.fromJson(Map<String, dynamic> json) {
    return RegisterResspons(
        message: json['message'],
        user: User.fromJson(json['user']),
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
