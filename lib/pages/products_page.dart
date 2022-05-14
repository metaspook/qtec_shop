import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _fetchProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            padding: const EdgeInsets.only(left: 20, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 0,
                mainAxisExtent: 260,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  title: index != 0
                      ? 'লেস ক্লাসিক ফ্যামিলি সাইজ চিপস্ চিপস্'
                      : 'Lays Classic Family Chips',
                  stock: index != 0 ? 10 : 0,
                  inCart: index != 1 ? false : true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Product>> _fetchProducts() async {
  const productOffset = 10;
  final response = await http.get(Uri.parse(
      "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=$productOffset"));
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
