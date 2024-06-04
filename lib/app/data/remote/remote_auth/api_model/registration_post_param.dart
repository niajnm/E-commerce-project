class RegistrationPostParam {
  final String username;
  final String email;
  final String password;

  RegistrationPostParam({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegistrationPostParam.fromJson(Map<String, dynamic> json) {
    return RegistrationPostParam(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
