import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class CartHexButton extends StatelessWidget {
  CartHexButton({Key? key}) : super(key: key);

  bool inCart = false;
  int cartItemCount = 5;
  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: inCart,
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
      child: HexagonWidget.pointy(
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
              child: inCart
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
    );
  }
}
