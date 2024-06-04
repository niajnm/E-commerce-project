import 'dart:developer';

import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';
import 'package:e_commerce/app/data/repository/product_repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductListRepository _repository =
      serviceLocator<ProductListRepository>();

  Future<List<ProductDataModel>> productData() async {
    List<ProductDataModel> response = await _repository.fetchProductData();

    log('productData param  ${response[1].name}');

    if (response.isNotEmpty) {
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
