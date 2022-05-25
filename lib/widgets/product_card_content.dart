import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/pages/pages.dart';
import 'package:qtec_shop/utils/utils.dart';

class ProductCardContent extends StatelessWidget {
  const ProductCardContent(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            LimitedBox(
              maxHeight: 800,
              maxWidth: 500,
              child: CachedNetworkImage(
                imageUrl: product.image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator.adaptive(
                        value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 5),
            Text(product.productName + '\n',
                maxLines: 2, style: TextStyles.productCardTitle),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'ক্রয়s',
                      style: TextStyles.productCardPriceTitle,
                      children: [
                        TextSpan(text: ' ' * 5),
                        TextSpan(
                          text: '\$ ${product.currentCharge}',
                          style: TextStyles.productCardPriceBig,
                        )
                      ]),
                ),
                Text(
                  '\$ ${product.discountCharge}',
                  style: TextStyles.productCardPriceSecondary,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'বিক্রয়',
                      style: TextStyles.productCardPriceTitle,
                      children: [
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: '\$ ${product.sellingPrice ?? 'N/A'}',
                          style: TextStyles.productCardPricePrimary,
                        )
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'লাভ',
                      style: TextStyles.productCardPriceTitle,
                      children: [
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: '\$ ${product.profit ?? 'N/A'}',
                          style: TextStyles.productCardPricePrimary,
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
