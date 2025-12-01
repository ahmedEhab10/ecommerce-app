class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  RegisterRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;
    data['phone'] = this.phone;
    return data;
  }
}
