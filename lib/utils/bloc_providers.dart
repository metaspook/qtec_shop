import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class BlocProviders {
  BlocProviders._();
  static final myApp = <BlocProvider>[
    BlocProvider<ProductsCubit>(
      create: (_) => ProductsCubit()..getProducts(),
    ),
    BlocProvider<CartCounterState>(
      create: (_) => CartCounterState(),
    ),
  ];
}
