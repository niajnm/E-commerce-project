import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote_auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/remote/remote_auth/auth_remote_source_impl.dart';
import 'package:e_commerce/app/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:logger/logger.dart';
import 'package:e_commerce/app/data/remote/end_point_api.dart';

import 'package:e_commerce/flavors/build_config.dart';
import 'package:e_commerce/flavors/env_config.dart';
import 'package:e_commerce/flavors/environment.dart';
import 'remote_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late AuthRemoteSourceImpl remoteDataSource;
  late MockDio mockDio;

  setUp(() {
    setupBuildConfigForTesting();
    mockDio = MockDio();
    remoteDataSource = AuthRemoteSourceImpl();
  });

  group('logInApiService', () {
    final userName = 'op';
    final userPassword = '9900';

    test('returns a LoginResponseModel if the http call completes successfully',
        () async {
      final responseData = {
        //  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwdGVzdC5kb2thbmRlbW8uY29tIiwiaWF0IjoxNzE3ODA0NzU3LCJuYmYiOjE3MTc4MDQ3NTcsImV4cCI6MTcxODQwOTU1NywiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiNzAwIn19fQ.bn6XbdxYIY5KV1SEhXyTp5QkEZyyIIsDtlbwWlATpjk",
        "user_email": "op@gmail.com",
        "user_nicename": "op",
        "user_display_name": "op"
      };

      when(mockDio.post(
        loginUrl,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: loginUrl)));
      LoginPostParams param =
          LoginPostParams(userName: userName, pass: userPassword);

      final result = await remoteDataSource.userLogin(param);

      expect(result, isA<LoginResponseModel>());
      expect(result.userEmail, 'op@gmail.com');
      expect(result.userNicename, 'op');
      expect(result.userDisplayName, 'op');
    });
  });
}

void setupBuildConfigForTesting() {
  EnvConfig testConfig = EnvConfig(
    appName: "Your Test App",
    baseUrl: "https://apptest.dokandemo.com/",
    shouldCollectCrashLog: false,
  );

  Logger(
    printer: PrettyPrinter(
      methodCount: loggerMethodCount,
      errorMethodCount: loggerErrorMethodCount,
      lineLength: loggerLineLength,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: testConfig,
  );
}
