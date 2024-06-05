import 'dart:convert';

import 'package:e_commerce/app/data/remote/remote_auth/auth_remote_source.dart';
import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';
import 'package:e_commerce/app/data/repository/product_repository/product_repository.dart';
import 'package:flutter/services.dart';

class ProductListRepositoryImpl implements ProductListRepository {
  final AuthRemoteSource _remoteSource;
  ProductListRepositoryImpl(this._remoteSource);

  @override
Future<List<ProductDataModel>> fetchProductData() async {
  // Load the JSON file from assets
  final String response = await rootBundle.loadString('assets/json/response.json');
  final List<dynamic> data = json.decode(response);

  // Parse the JSON data
  return data.map((json) => ProductDataModel.fromJson(json)).toList();
}
}

