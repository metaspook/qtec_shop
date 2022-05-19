import 'package:flutter/material.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/pages/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key})
      : isLoading = false,
        super(key: key);
  const ProductCard.loading({Key? key})
      : isLoading = true,
        product = null,
        super(key: key);
  final Product? product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.black,

      // height: 500,
      // width: 400,
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 16,
      ),
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 7,
      // ),
      // padding: const EdgeInsets.all(8),
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
      child: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : product == null
              ? null
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product!),
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
                          child: Image.network(
                            product!.image,

                            // fit: BoxFit.fitHeight,
                            // height: 100,
                            // width: 200,
                          ),
                        ),
                        // Image.asset(
                        //   "assets/images/potato_chips_00.png",
                        //   width: 75,
                        // ),
                        const SizedBox(height: 10),
                        Text(product!.productName,
                            maxLines: 2, style: _ProductCardTextStyle.title),
                        const SizedBox(height: 8),
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
                                      text: '\$ ${product!.currentCharge}',
                                      style: _ProductCardTextStyle.priceBig,
                                    )
                                  ]),
                            ),
                            Text(
                              '\$ ${product!.discountCharge}',
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
                                      text: '\$ ${product!.sellingPrice}',
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
                                      text: '\$ ${product!.profit}',
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
