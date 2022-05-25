import 'package:flutter/material.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/product_card_content.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);
  const ProductCard.loading({Key? key})
      : product = null,
        super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ProductCardBase(
            child: ProductCardContent(product!),
          ),
          if (product!.stock == 0)
            const Positioned(right: 12, top: 12, child: StockoutBadge()),
        ],
      );
    }
    return const ProductCardBase(
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
