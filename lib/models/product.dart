import 'package:qtec_shop/models/models.dart';

class Product {
  Product({
    required this.id,
    required this.brandName,
    required this.queryString,
    required this.image,
    required this.currentCharge,
    required this.discountCharge,
    required this.sellingPrice,
    required this.profit,
    required this.images,
    required this.productName,
    required this.description,
    required this.maximumOrder,
    required this.stock,
    required this.seller,
  });
  final String id;
  final String brandName;
  final String queryString;
  final String image;
  final num currentCharge;
  final num discountCharge;
  final num? sellingPrice;
  final num? profit;
  final List<DetailImage> images;
  final String productName;
  final String description;
  final int maximumOrder;
  final int stock;
  final String seller;

  // create model object from json object.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"].toString(),
      brandName: json["brand"]["name"],
      queryString: json["brand"]["slug"],
      image: json["image"],
      currentCharge: json["charge"]["current_charge"],
      discountCharge: json["charge"]["discount_charge"] ?? 0,
      sellingPrice: json["charge"]["selling_price"],
      profit: json["charge"]["profit"],
      images: [for (var e in json["images"]) DetailImage.fromJson(e)],
      productName: json["product_name"],
      description: json["description"],
      maximumOrder: json["maximum_order"],
      stock: json["stock"],
      seller: json["seller"],
    );
  }

  // create json object from model object.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "brandName": brandName,
      "queryString": queryString,
      "image": image,
      "currentCharge": currentCharge,
      "discountCharge": discountCharge,
      "sellingPrice": sellingPrice,
      "profit": profit,
      "images": images,
      "productName": productName,
      "description": description,
      "maximumOrder": maximumOrder,
      "stock": stock,
      "seller": seller,
    };
  }
}
