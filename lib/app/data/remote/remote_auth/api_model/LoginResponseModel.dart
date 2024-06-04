class LoginResponseModel {
  final String? token;
  final String? userEmail;
  final String? userNicename;
  final String? userDisplayName;

  LoginResponseModel({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] as String,
      userEmail: json['user_email'] as String,
      userNicename: json['user_nicename'] as String,
      userDisplayName: json['user_display_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user_email': userEmail,
      'user_nicename': userNicename,
      'user_display_name': userDisplayName,
    };
  }
}
