import 'detail_image.dart';

//  "id": 1350,
//     "brand": {
//         "name": "Abul Khair Consumer Goods"
//     },
//     "image": "https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1350/halim_6.png",
//     "charge": {
//         "current_charge": 165.0,
//         "selling_price": 190.0,
//         "profit": 25.0
//     },
//     "images": [
//     ],
//     "product_name": "সিলন চা (পিডি)- ৫০০ গ্রাম ",
//     "description": "   <div><font color=\"#000000\" face=\"Noto Sans, sans-serif\" style=\"letter-spacing: 0.14px;\"><span style=\"font-size: 16px; letter-spacing: -0.3px;\">প্রদর্শিত বিক্রয়মূল্য এবং লাভের পরিমাণ পরিবর্তনশীল। বাজার এবং&nbsp;</span></font><span style=\"color: rgb(0, 0, 0); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 16px; letter-spacing: -0.3px;\">বিক্রেতার</span><font color=\"#000000\" face=\"Noto Sans, sans-serif\" style=\"letter-spacing: 0.14px;\"><span style=\"font-size: 16px; letter-spacing: -0.3px;\">&nbsp;বিবেচনার উপর নির্ভরশীল।</span></font><br></div><div><br></div>    ",
//     "maximum_order": 100,
//     "stock": 813,
//     "seller": "AKCG"

class Product {
  final int id;
  final String brandName;
  final String image;
  final num currentCharge;
  final num sellingPrice;
  final num profit;
  final List<DetailImage> images;
  final String productName;
  final String description;
  final int maximumOrder;
  final int stock;
  final String seller;

  Product({
    required this.id,
    required this.brandName,
    required this.image,
    required this.currentCharge,
    required this.sellingPrice,
    required this.profit,
    required this.images,
    required this.productName,
    required this.description,
    required this.maximumOrder,
    required this.stock,
    required this.seller,
  });

  // create model object from json object.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      brandName: json["brand"]["name"],
      image: json["image"],
      currentCharge: json["charge"]["current_charge"],
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
  // static List<Product> fromJsonList(List<Map<String, dynamic>> jsonList) =>
  //     [for (Map<String, dynamic> e in jsonList) Product.fromJson(e)];

  // create json object from model object.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "brandName": brandName,
      "image": image,
      "currentCharge": currentCharge,
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

  // factory Product.fromSnapshot(Object? object) {
  //   final Map<String, dynamic> objectMap = {};
  //   (object as Map).forEach((k, v) => objectMap[k] = v);
  //   return Product.fromJson(objectMap);
  // }

  // static List<Order> fromSnapshotChildren(Iterable<DataSnapshot> list) =>
  //     [for (DataSnapshot e in list) Order.fromSnapshot(e.value)];

  // get total price of an order.
  // num get getTotal => [for (CartProduct e in cartProductList) e.getSubTotal]
  //     .reduce((v, e) => v + e);

  // static List<Order> fromJsonList(List<Map<String, dynamic>> jsonList) =>
  //     [for (Map<String, dynamic> e in jsonList) Order.fromJson(e)];
  // static List<Order> fromJsonListString(String listString) => [
  //       for (Map<String, dynamic> e in jsonDecode(listString)) Order.fromJson(e)
  //     ];

  // factory Order.fromJsonString(String jsonString) =>
  //     Order.fromJson(jsonDecode(jsonString));

  // String toJsonString() => jsonEncode(toJson());

  // static List<Order> fromJsonStringList(List<String> list) =>
  //     [for (String e in list) Order.fromJsonString(e)];

  // static List<String> toJsonStringList(List<Order> list) =>
  //     [for (Order e in list) e.toJsonString()];

  // @override
  // String toString() {
  //   return 'Order(id: $id, userId: $userId, status: $status, cartProductList: $cartProductList)';
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is Order &&
  //       other.id == id &&
  //       other.userId == userId &&
  //       other.status == status &&
  //       listEquals(other.cartProductList, cartProductList);
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       userId.hashCode ^
  //       status.hashCode ^
  //       cartProductList.hashCode;
  // }
}
