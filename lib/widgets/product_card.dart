import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/potato_chips_00.png",
            width: 75,
          ),
          const SizedBox(height: 10),
          Text(title, style: _ProductCardTextStyle.title),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'ক্রয়',
                    style: _ProductCardTextStyle.priceTitle,
                    children: [
                      TextSpan(text: ' ' * 5),
                      const TextSpan(
                        text: '\$ 20.00',
                        style: _ProductCardTextStyle.priceBig,
                      )
                    ]),
              ),
              const Text(
                '\$ 22.00',
                style: _ProductCardTextStyle.priceSecondary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'বিক্রয়',
                    style: _ProductCardTextStyle.priceTitle,
                    children: [
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: '\$ 25.00',
                        style: _ProductCardTextStyle.pricePrimary,
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: 'লাভ',
                    style: _ProductCardTextStyle.priceTitle,
                    children: [
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: '\$ 5.00',
                        style: _ProductCardTextStyle.pricePrimary,
                      )
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _ProductCardTextStyle {
  _ProductCardTextStyle._();
  static const title = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static const priceTitle = TextStyle(
    color: Colors.grey,
    fontSize: 10,
  );
  static const priceBig = TextStyle(
    color: Colors.pink,
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static final pricePrimary = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const priceSecondary = TextStyle(
    color: Colors.pink,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.lineThrough,
  );
}
