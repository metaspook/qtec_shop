import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';

class Add2CartButton extends StatelessWidget {
  const Add2CartButton(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: .65,
      scaleY: .65,
      child: Container(
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
          onPressed: () => context.read<CartCubit>().add(product),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
