import 'dart:developer';

import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';
import 'package:e_commerce/app/data/repository/product_repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductListRepository _repository =
      serviceLocator<ProductListRepository>();

  List<ProductDataModel> _products = [];

  List<ProductDataModel> get getProducts => _products;

  productData() async {
    List<ProductDataModel> response = await _repository.fetchProductData();

    log('productData param  ${response[1].name}');

    if (response.isNotEmpty) {
      _products = [];
      _products = response;
      notifyListeners();
    } else {
      // var error = LoginResponseModel(
      //     statusCode: response['status_code'],
      //     result: null,
      //     message: response['message']);
      // return error;

      return response;
    }
  }

  void sortByRating() {
    _products.sort((a, b) => b.rating.compareTo(a.rating));

    notifyListeners();
  }

  void sortByBestSelling() {
    // _products.sort((a, b) => b.totalSales.compareTo(a.totalSales));
  }

  void sortByPrice(bool ascending) {
    if (ascending) {
      _products.sort((a, b) => a.price.compareTo(b.price));
    } else {
      _products.sort((a, b) => b.price.compareTo(a.price));
    }
    notifyListeners();
  }
}
