import 'package:flutter/material.dart';

class Add2CartButton extends StatelessWidget {
  const Add2CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
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
    );
  }
}
