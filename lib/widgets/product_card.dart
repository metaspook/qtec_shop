import 'package:flutter/material.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/pages/product_detail_page.dart';
import 'package:qtec_shop/widgets/quantity_button_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    const inCart = false;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _BaseCard(product),
        if (product.stock != 0)
          inCart == true
              ? const Positioned(
                  // top: -10,
                  bottom: 15,
                  // right: 0,
                  child: QuantityButtonBar(),
                )
              : Positioned(
                  // top: -10,
                  // bottom: 0,
                  // right: 0,
                  child: Transform.scale(
                    scaleX: .65,
                    scaleY: .65,
                    child: Container(
                      // height: 50, width: 50,
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        // color: Color.fromRGBO(255, 204, 204, 1),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(98, 16, 225, 1),
                              Color.fromRGBO(20, 0, 174, 1)
                            ]),
                        // borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    );
  }
}

class _BaseCard extends StatelessWidget {
  const _BaseCard(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          padding: const EdgeInsets.only(
            left: 9,
            right: 9,
            top: 7.5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    // left: 10,
                    // right: 10,
                    top: 10,
                    // bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Image.network(product.image),
                      // Image.asset(
                      //   "assets/images/potato_chips_00.png",
                      //   width: 75,
                      // ),
                      const SizedBox(height: 10),
                      Text(product.productName,
                          maxLines: 2, style: _ProductCardTextStyle.title),
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
                                  TextSpan(
                                    text: '\$ ${product.currentCharge}',
                                    style: _ProductCardTextStyle.priceBig,
                                  )
                                ]),
                          ),
                          Text(
                            '\$ ${product.discountCharge}',
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
                                    text: '\$ ${product.sellingPrice}',
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
                                    text: '\$ ${product.profit}',
                                    style: _ProductCardTextStyle.pricePrimary,
                                  )
                                ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              if (product.stock == 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 204, 204, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('স্টকে নেই',
                        style: _ProductCardTextStyle.stockStatus),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20)
      ],
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
  static final stockStatus = TextStyle(
    color: Colors.pink.shade800,
    // fontSize: 12,
    // fontWeight: FontWeight.bold,
    // decoration: TextDecoration.lineThrough,
  );
}
