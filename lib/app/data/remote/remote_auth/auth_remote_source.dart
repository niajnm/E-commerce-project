import 'package:e_commerce/app/data/remote/remote_auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/registration_post_param.dart';

abstract class AuthRemoteSource {
  Future<dynamic> userRegistration(RegistrationPostParam queryParams);
  Future<LoginResponseModel> userLogin(LoginPostParams queryParams);
  Future<LoginResponseModel> updateProfile(LoginPostParams queryParams);
}
