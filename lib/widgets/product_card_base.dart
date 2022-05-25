import 'package:flutter/material.dart';

class ProductCardBase extends StatelessWidget {
  const ProductCardBase({required this.child, Key? key}) : super(key: key);
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
