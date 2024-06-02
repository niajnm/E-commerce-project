import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_assesment/app/core/network/dio_Singleton.dart';
import 'package:weather_assesment/app/core/network/error_handlers.dart';
import 'package:weather_assesment/app/core/network/exceptions/base_exception.dart';
import 'package:path_provider/path_provider.dart';

import '../../../flavors/build_config.dart';

abstract class BaseRemoteSource {
  Dio get dioCli => DioProvider.httpDio;
  Dio get dioClientAuth => DioProvider.dioWithHeaderToken;
  Dio get dioWithCacheClient => DioProvider.httpDioWithCache;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        // logger.log(level, message)
      }

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw (exception).message;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }

  Future<File> getCachedFile(String fileName) async {
    var dir = await getTemporaryDirectory();
    return File(dir.path + "/" + fileName);
  }

  Future<void> cacheDataToFile(String fileName, String data) async {
    final file = await getCachedFile(fileName);
    await file.writeAsString(data);
  }

  Future<String?> readDataFromFile(String fileName) async {
    final file = await getCachedFile(fileName);
    if (file.existsSync()) {
      return file.readAsString();
    }
    return null;
  }

  // Function to clear the cache for the specified file.
  Future<void> clearCacheFile(String cacheFileName) async {
    final file = await getCachedFile(cacheFileName);

    if (file.existsSync()) {
      await file.delete();
    }
  }
}
