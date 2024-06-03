
class LoginPostParams {
  final String userName;
  final String pass;

  LoginPostParams({required this.userName, required this.pass});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;
    data['password'] = pass;


    return data;
  }
}
