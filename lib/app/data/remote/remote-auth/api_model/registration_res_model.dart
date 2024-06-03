class RegistrationResponseModel {
  final int code;
  final String message;

  RegistrationResponseModel({
    required this.code,
    required this.message,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return RegistrationResponseModel(
      code: json['code'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }
}
