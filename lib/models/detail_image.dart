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
}
