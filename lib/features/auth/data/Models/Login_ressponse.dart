import 'package:ecommerce_app/features/auth/data/Models/User.dart';

class LoginRessponse {
  final String message;
  final User user;
  final String token;

  const LoginRessponse(
      {required this.message, required this.user, required this.token});

  factory LoginRessponse.fromJson(Map<String, dynamic> json) {
    return LoginRessponse(
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
