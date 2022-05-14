// {
//             "id": 1341,
//             "image": "https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1350/halim_6.png",
//             "is_primary": true,
//             "product": 1350
//         }

class DetailImage {
  final int id;
  final String image;
  final bool isPrimary;
  final int product;

  DetailImage({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });

  // create model object from json object.
  factory DetailImage.fromJson(Map<String, dynamic> json) {
    return DetailImage(
      id: json["id"],
      image: json["image"],
      isPrimary: json["is_primary"],
      product: json["product"],
    );
  }

  // create json object from model object.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "image": image,
      "isPrimary": isPrimary,
      "product": product
    };
  }

  // factory DetailImage.fromSnapshot(Object? object) {
  //   final objectMap = <String, dynamic>{};
  //   (object as Map).forEach((k, v) => objectMap[k] = v);
  //   return DetailImage.fromJson(objectMap);
  // }

  // static List<DetailImage> fromJsonList(List<Map<String, dynamic>> jsonList) =>
  //     [for (Map<String, dynamic> e in jsonList) DetailImage.fromJson(e)];
  // static List<DetailImage> fromJsonListString(String listString) => [
  //       for (Map<String, dynamic> e in jsonDecode(listString))
  //         DetailImage.fromJson(e)
  //     ];

  // factory DetailImage.fromJsonString(String jsonString) =>
  //     DetailImage.fromJson(jsonDecode(jsonString));

  // String toJsonString() => jsonEncode(toJson());

  // static List<DetailImage> fromJsonStringList(List<String> list) =>
  //     [for (String e in list) DetailImage.fromJsonString(e)];

  // static List<String> toJsonStringList(List<DetailImage> list) =>
  //     [for (DetailImage e in list) e.toJsonString()];

  // @override
  // String toString() =>
  //     'CartProduct(productId: $productId, productImage: $productImage,productName: $productName,quantity: $quantity, unitPrice: $unitPrice,subTotal: $subTotal)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is DetailImage &&
  //       other.productId == productId &&
  //       other.productImage == productImage &&
  //       other.productName == productName &&
  //       other.quantity == quantity &&
  //       other.unitPrice == unitPrice &&
  //       other.subTotal == subTotal;
  // }

  // @override
  // int get hashCode =>
  //     productId.hashCode ^
  //     productImage.hashCode ^
  //     productName.hashCode ^
  //     quantity.hashCode ^
  //     unitPrice.hashCode ^
  //     subTotal.hashCode;
}
