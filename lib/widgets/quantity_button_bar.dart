import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class QuantityButtonBar extends StatelessWidget {
  const QuantityButtonBar(this.productId, {Key? key}) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final cartProduct = context.watch<CartCubit>().id2cartProduct(productId);
    return Container(
      width: 140,
      height: 30,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 204, 204, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 3.5),
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 191, 221, 1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () =>
                  context.read<CartCubit>().decrementQuantity(productId),
              icon: Icon(
                Icons.remove,
                size: 10,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Expanded(
            child: Text('${cartProduct.quantity} পিস',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink.shade800)),
          ),
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(98, 16, 225, 1),
                    Color.fromRGBO(20, 0, 174, 1)
                  ]),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () =>
                  context.read<CartCubit>().incrementQuantity(productId),
              icon: Icon(
                Icons.add,
                size: 10,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          const SizedBox(width: 3.5),
        ],
      ),
    );
  }
}
