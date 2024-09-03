import 'package:air_bnb/support_files/ip_address.dart';
import 'package:dio/dio.dart';

import '../model_class/product_list.dart';

class ApiRepository {
  final Dio _dio = Dio();
  get _exploreUrl => mainExploreApi;

  Future<ProductList> exploreProduct() async {
    try {
      Response response = await _dio.get(_exploreUrl);
      if (response.statusCode == 200) {
        return ProductList.fromJson(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (error) {
      throw Exception('Failed to load product: $error');
    }
  }
}
