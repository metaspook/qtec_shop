import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qtec_shop/models/models.dart';

class DataService {
  Future<List<Product>> fetchProducts([int offset = 10]) async {
    final response = await http.get(Uri.parse(
        "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=$offset"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      // return products.
      return [
        for (Map<String, dynamic> e in json["data"]["products"]["results"])
          Product.fromJson(e)
      ];
    } else {
      throw Exception(
          "[${response.statusCode}] Couldn't fetch the api response!");
    }
  }
}
