import 'package:e_commerce/app/data/repository/product_repository/model/product_data_model.dart';

abstract class ProductListRepository {
  Future<List<ProductDataModel>> fetchProductData();
}
