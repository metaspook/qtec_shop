import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.title,
      required this.stock,
      required this.inCart})
      : super(key: key);
  final String title;
  final int stock;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
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
                  Padding(
                    padding: const EdgeInsets.only(
                      // left: 10,
                      // right: 10,
                      top: 10,
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
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  if (stock == 0)
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
        ),
        if (stock != 0)
          inCart == true
              ? Positioned(
                  // top: -10,
                  bottom: 10,
                  // right: 0,
                  child: Container(
                    // padding:
                    //     const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    width: 122.5,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 204, 204, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 25, width: 25,

                          // height: 50, width: 50,
                          // padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 191, 221, 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              size: 10,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text('5 পিস', style: _ProductCardTextStyle.stockStatus),
                        const SizedBox(width: 15),
                        Container(
                          // alignment: Alignment.topCenter,
                          height: 25, width: 25,
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
                              size: 10,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Positioned(
                  // top: -10,
                  bottom: 5,
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
