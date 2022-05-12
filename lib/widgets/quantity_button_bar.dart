import 'package:flutter/material.dart';

class QuantityButtonBar extends StatelessWidget {
  const QuantityButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding:
      //     const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      width: 130,
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
          const SizedBox(width: 20),
          Text('5 পিস', style: TextStyle(color: Colors.pink.shade800)),
          const SizedBox(width: 20),
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
    );
  }
}
