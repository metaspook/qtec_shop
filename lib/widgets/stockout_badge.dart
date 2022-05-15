import 'package:flutter/material.dart';

class StockoutBadge extends StatelessWidget {
  const StockoutBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // height: 200,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 204, 204, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text('স্টকে নেই', style: TextStyle(color: Colors.pink.shade800)),
    );
  }
}
