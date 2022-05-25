import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("প্রোডাক্ট ডিটেইল"),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(50, 50, 50, 1),
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          const SearchBar(),
          ProductDetailCarousel(product.images),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ProductDetailColumn(product),
                if (product.stock != 0) ...[
                  if (context
                      .watch<CartCubit>()
                      .containsProductById(product.id))
                    Positioned(
                      top: 90,
                      child: QuantityButtonBar(product.id),
                    ),
                  Positioned(
                    top: 125,
                    child: CartHexButton(product),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
