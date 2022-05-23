import 'package:qtec_shop/models/models.dart';

class CartProduct {
  final String productId;
  final String productImage;
  final String productName;
  final int quantity;
  final int maxOrderQuantity;
  final num unitPrice;
  final num subTotal;

  CartProduct({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.maxOrderQuantity,
    required this.unitPrice,
    required this.subTotal,
  });

  // // create model object from json object.
  // factory CartProduct.fromJson(Map<String, dynamic> json) {
  //   return CartProduct(
  //     productId: json["productId"],
  //     productImage: json["productImage"],
  //     productName: json["productName"],
  //     quantity: json["quantity"] ?? 0,
  //     maxOrderQuantity: json["maxOrderQuantity"] ?? 0,
  //     unitPrice: json["unitPrice"] ?? 0,
  //     subTotal: json["subTotal"] ?? 0,
  //   );
  // }

  // // create json object from model object.
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     "productId": productId,
  //     "productImage": productImage,
  //     "productName": productName,
  //     "quantity": quantity,
  //     "unitPrice": unitPrice,
  //     "subTotal": subTotal
  //   };
  // }

  factory CartProduct.fromProduct(
      {required Product product, required int quantity}) {
    return CartProduct(
      productId: product.id,
      productImage: product.image,
      productName: product.productName,
      quantity: quantity,
      maxOrderQuantity: product.maximumOrder,
      unitPrice: product.currentCharge,
      subTotal: product.currentCharge * quantity,
    );
  }

  CartProduct copyWith({
    String? productId,
    String? productImage,
    String? productName,
    int? quantity,
    int? maxOrderQuantity,
    num? unitPrice,
    num? subTotal,
  }) =>
      CartProduct(
        productId: productId ?? this.productId,
        productImage: productImage ?? this.productImage,
        productName: productName ?? this.productName,
        quantity: quantity ?? this.quantity,
        maxOrderQuantity: maxOrderQuantity ?? this.maxOrderQuantity,
        unitPrice: unitPrice ?? this.unitPrice,
        subTotal: subTotal ?? this.subTotal,
      );
}
