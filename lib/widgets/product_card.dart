import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/pages/product_detail_page.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);
  static Widget loading() {
    return const _BaseCard(Center(child: CircularProgressIndicator.adaptive()));
  }

  // final bool inCart;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final inCart = context.watch<CartCubit>().state.contains(product);
    // print(context.watch<CartCubit>().state);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _BaseCard(
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product),
                ),
              );
            },
            child: SingleChildScrollView(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: product.image,
                  //   placeholder: (context, url) => const LinearProgressIndicator(),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  LimitedBox(
                    // constraints: const BoxConstraints.loose(
                    maxHeight: 800,
                    maxWidth: 500,
                    // minHeight: 50,
                    // minWidth: 50,
                    // ),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator.adaptive(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    // Image.network(
                    // product!.image,

                    // fit: BoxFit.fitHeight,
                    // height: 100,
                    // width: 200,
                    // ),
                  ),
                  // Image.asset(
                  //   "assets/images/potato_chips_00.png",
                  //   width: 75,
                  // ),
                  const SizedBox(height: 5),
                  Text(product.productName + '\n',
                      maxLines: 2, style: _ProductCardTextStyle.title),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'ক্রয়s',
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
                  // const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
        if (product.stock == 0)
          const Positioned(right: 12, top: 12, child: StockoutBadge()),
        // if (product.stock != 0)
        //   Positioned(
        //       // bottom: -3,
        //       child: context.watch<CartCubit>().state.contains(product)
        //           ? const QuantityButtonBar(quantity: 5)
        //           : Add2CartButton(product)),
      ],
    );
  }
}

class _BaseCard extends StatelessWidget {
  const _BaseCard(this.child, {Key? key}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 16,
      ),
      padding: const EdgeInsets.only(
        left: 9,
        right: 9,
        top: 9,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
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
