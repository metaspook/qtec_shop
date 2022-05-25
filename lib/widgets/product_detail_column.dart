import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:qtec_shop/models/models.dart';

class ProductDetailColumn extends StatelessWidget {
  const ProductDetailColumn(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.productName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            RichText(
              text: TextSpan(
                  text: 'ব্রান্ডঃ ',
                  style: const TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: product.brandName,
                      style: const TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            const SizedBox(width: 5),
            Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(218, 32, 121, 1),
                  shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
            RichText(
              text: TextSpan(
                  text: 'ডিস্ট্রিবিউটরঃ ',
                  style: const TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: product.seller,
                      style: const TextStyle(
                          color: Color.fromRGBO(50, 50, 50, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 25),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ক্রয়মূল্যঃ',
                          style: TextStyle(
                              color: Color.fromRGBO(218, 32, 121, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '৳ ${product.currentCharge}',
                          style: const TextStyle(
                              color: Color.fromRGBO(218, 32, 121, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'বিক্রয়মূল্যঃ',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '৳ ${product.sellingPrice}',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // dashed divider.
              Row(
                children: <Widget>[
                  for (var i = 0; i < 150 ~/ 2; i++)
                    Expanded(
                      child: Container(
                        height: 1,
                        color: i % 2 == 0
                            ? Colors.transparent
                            : Colors.grey.shade400,
                      ),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'লাভঃ',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '৳ ${product.profit}',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Text(
          'বিস্তারিত',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Html(
          data: product.description,
          style: {"span": Style(color: const Color.fromRGBO(100, 100, 100, 1))},
        ),
      ],
    );
  }
}
