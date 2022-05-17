import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagon/hexagon.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class CartHexButton extends StatelessWidget {
  const CartHexButton(this.cartItemCount, {Key? key}) : super(key: key);
  final int cartItemCount;

  double get _badgeSpace {
    final badgeSpace = cartItemCount.toString().length.toDouble();
    return badgeSpace * badgeSpace;
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: cartItemCount != 0,
      badgeColor: const Color.fromRGBO(255, 204, 228, 1),
      padding: const EdgeInsets.all(6.5),
      position: BadgePosition.topEnd(top: 1),
      borderSide: const BorderSide(
          width: 1,
          color: Color.fromRGBO(255, 255, 255, 1),
          style: BorderStyle.solid), //BorderSide

      badgeContent: Text(
        cartItemCount.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromRGBO(218, 32, 121, 1), fontSize: 13),
      ),
      child: GestureDetector(
        onTap: cartItemCount == 0
            ? () => context.read<CartCounterState>().increment(5)
            : null,
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
                    child: cartItemCount != 0
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
            if (cartItemCount != 0)
              SizedBox(
                width: _badgeSpace,
              ),
          ],
        ),
      ),
    );
  }
}
