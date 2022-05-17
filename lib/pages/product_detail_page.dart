import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    // print(context.watch<CartCounterState>().state.toString());
    final cartProductCount = context.watch<CartCounterState>().state;

    bool inCart = true;
    final List<Widget> imageSlides = [
      product.images[0].image,
      'https://www.factroom.ru/wp-content/uploads/2019/04/5-osobennostej-klimata-pitera-o-kotoryh-vy-dolzhny-znat-esli-sobiraetes-syuda-priekhat.jpg',
      product.images[0].image,
      'https://cdn.flixbus.de/2018-01/munich-header-d8_0.jpg',
      product.images[0].image
    ]
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(item, fit: BoxFit.cover, width: 250)),
          ),
        )
        .toList(growable: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("প্রোডাক্ট ডিটেইল"),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(50, 50, 50, 1),
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SearchBar(),
          ListView(
            shrinkWrap: true,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: .65,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  initialPage:
                      product.images.indexWhere((element) => element.isPrimary),
                ),
                items: imageSlides,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _DetailColumn(product),
                    if (cartProductCount > 0)
                      const Positioned(
                          top: 90, child: QuantityButtonBar(quantity: 5)),
                    Positioned(
                        top: 125,
                        child: BlocBuilder<CartCounterState, int>(
                          builder: (context, state) {
                            return CartHexButton(state);
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailColumn extends StatelessWidget {
  const _DetailColumn(this.product, {Key? key}) : super(key: key);
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
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    // TextSpan(text: ' ' * 5),
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
                    // TextSpan(text: ' ' * 5),
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
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 25,
            // left: 5,
            // right: 5,
          ),
          // padding: const EdgeInsets.all(15),
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
                              // color: Color.fromRGBO(218, 32, 121, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '৳ ${product.sellingPrice}',
                          style: const TextStyle(
                              // color: Color.fromRGBO(218, 32, 121, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
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
                      style: TextStyle(
                          // color: Color.fromRGBO(218, 32, 121, 1),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '৳ ${product.profit}',
                      style: const TextStyle(
                          // color: Color.fromRGBO(218, 32, 121, 1),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
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
        const Text(
          'জীবের মধ্যে সবচেয়ে সম্পূর্ণতা মানুষের। কিন্তু সবচেয়ে অসম্পূর্ণ হয়ে সে জন্মগ্রহণ করে। বাঘ ভালুক তার জীবনযাত্রার পনেরো- আনা মূলধন নিয়ে আসে প্রকৃতির মালখানা থেকে। জীবরঙ্গভূমিতে মানুষ এসে দেখা দেয় দুই শূন্য হাতে মুঠো বেঁধে।',
          style: TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1),
          ),
        ),
      ],
    );
  }
}
