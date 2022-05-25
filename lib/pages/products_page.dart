import 'package:flutter/material.dart';
import 'package:qtec_shop/pages/products_view.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: const [
          SearchBar(),
          ProductsView(),
        ],
      ),
    );
  }
}
