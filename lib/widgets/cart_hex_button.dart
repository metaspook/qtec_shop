import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class CartHexButton extends StatelessWidget {
  const CartHexButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HexagonWidget.pointy(
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'এটি কিনুন',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
