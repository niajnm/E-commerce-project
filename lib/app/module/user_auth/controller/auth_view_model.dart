import 'dart:developer';

import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/local/preference/preference_manager.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/registration_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/registration_res_model.dart';
import 'package:e_commerce/app/data/repository/auth_repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserAuthViewModel extends ChangeNotifier {
  final AuthRepository _authenticationRepository =
      serviceLocator<AuthRepository>();

  Future<LoginResponseModel> logInApiService(userName, userPassword) async {
    final userRepository = serviceLocator<PreferenceManager>();

    LoginPostParams param =
        LoginPostParams(userName: userName, pass: userPassword);

    LoginResponseModel response =
        await _authenticationRepository.userLogin(param);

    if (response.token != null) {
      var box = await Hive.openBox<String>('LOCAL_STORE');

      await box.clear();
      String token = "${response.token}";
      await box.put('token', token);
      return response;
    } else {
      // var error = LoginResponseModel(
      //     statusCode: response['status_code'],
      //     result: null,
      //     message: response['message']);
      // return error;

      return response;
    }
  }

  Future<RegistrationResponseModel> userRegistration(
      userName, userMail, userPassword, confirmPass) async {
    log('RegistrationPostParam $userName $userMail $userPassword');
    // RegistrationPostParam param = RegistrationPostParam(
    //     username: 'userr1', email: 'userrr1@gmail.com', password: '000555');
    RegistrationPostParam param = RegistrationPostParam(
        username: userName, email: userMail, password: confirmPass);
    log('login param $userName $userPassword');
    RegistrationResponseModel response =
        await _authenticationRepository.userRegistration(param);

    log('login param $userName $userPassword');

    if (response.code == 200) {
      return response;
    } else {
      // var error = LoginResponseModel(
      //     statusCode: response['status_code'],
      //     result: null,
      //     message: response['message']);
      // return error;

      return response;
    }
  }
}
