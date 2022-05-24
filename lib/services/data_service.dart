import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qtec_shop/models/models.dart';

class DataService {
  //  singleton pattern.
  DataService._();
  factory DataService() => DataService._();
  Future<List<Product>> fetchProducts(
      {int offset = 0, String query = ''}) async {
    final response = await http.get(
      Uri.parse(
          "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=$offset&search=$query"),
      // headers: {"content-type": "application/json; charset=utf-8"}
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(utf8.decode(response.bodyBytes));
      // return products.
      // print(response.headers);
      // print(json["data"]["products"]["results"][2]["product_name"]);
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
