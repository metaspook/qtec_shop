import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();
  static const productCardTitle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const productCardPriceTitle = TextStyle(
    color: Colors.grey,
    fontSize: 10,
  );
  static const productCardPriceBig = TextStyle(
    color: Colors.pink,
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static final productCardPricePrimary = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const productCardPriceSecondary = TextStyle(
    color: Colors.pink,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.lineThrough,
  );
  static final productCardStockStatus = TextStyle(
    color: Colors.pink.shade800,
  );
}
