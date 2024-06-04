import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/app/data/remote/end_point_api.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/registration_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/registration_res_model.dart';
import 'package:e_commerce/app/data/remote/remote_auth/auth_remote_source.dart';

import '../../../core/base/base_remote_source.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  @override
  Future userRegistration(RegistrationPostParam queryParams) {
    //   log('post data $queryParams');

    var endpoint = registrationUrl;
    var dioCall = dioCli.post(endpoint, data: queryParams.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseRegModelResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  RegistrationResponseModel _parseRegModelResponse(Response<dynamic> response) {
    log('login info 2 $response');
    return RegistrationResponseModel.fromJson(response.data);
  }

  @override
  Future<LoginResponseModel> userLogin(LoginPostParams queryParams) {
    var endpoint = loginUrl;
    var dioCall = dioCli.post(endpoint, queryParameters: queryParams.toJson());

    log('login info $dioCall');

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseLoginResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  LoginResponseModel _parseLoginResponse(Response<dynamic> response) {
    log('login info 2 $response');
    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<LoginResponseModel> updateProfile(LoginPostParams queryParams) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
