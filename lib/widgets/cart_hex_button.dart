import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagon/hexagon.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';

class CartHexButton extends StatelessWidget {
  const CartHexButton(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    //  method 1 (badge quantity by sum of products)
    // final cartProductsCount = cartCubit.state.length;
    //  method 2 (badge quantity by sum of products's quantity)
    final cartProductsCount = <int>[
      0,
      ...cartCubit.state.map<int>((e) => e.quantity)
    ].reduce((v, e) => v + e);

    double badgeSpace = cartProductsCount.toString().length.toDouble();
    badgeSpace *= badgeSpace;
    return Badge(
      showBadge: cartCubit.containsProductById(product.id),
      badgeColor: const Color.fromRGBO(255, 204, 228, 1),
      padding: const EdgeInsets.all(6.5),
      position: BadgePosition.topEnd(top: 1),
      borderSide: const BorderSide(
          width: 1,
          color: Color.fromRGBO(255, 255, 255, 1),
          style: BorderStyle.solid), //BorderSide

      badgeContent: Text(
        cartProductsCount.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromRGBO(218, 32, 121, 1), fontSize: 13),
      ),
      child: GestureDetector(
        onTap: cartCubit.containsProductById(product.id)
            ? null
            : () => context.read<CartCubit>().add(product),
        child: Row(
          children: [
            HexagonWidget.pointy(
              cornerRadius: 15,
              width: 60,
              elevation: 8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(98, 16, 225, 1),
                            Color.fromRGBO(20, 0, 174, 1)
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cartCubit.containsProductById(product.id)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              Text(
                                'কার্ট',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13),
                              ),
                            ],
                          )
                        : const Text(
                            'এটি কিনুন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 13),
                          ),
                  ),
                ],
              ),
            ),
            if (cartProductsCount != 0)
              SizedBox(
                width: badgeSpace,
              ),
          ],
        ),
      ),
    );
  }
}
