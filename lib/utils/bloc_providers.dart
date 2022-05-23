import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class BlocProviders {
  BlocProviders._();
  static final myApp = <BlocProvider>[
    BlocProvider<ProductsCubit>(
      create: (_) => ProductsCubit(),
    ),
    BlocProvider<CartCounterCubit>(
      create: (_) => CartCounterCubit(),
    ),
    BlocProvider<SearchbarCubit>(
      create: (_) => SearchbarCubit(),
    ),
    BlocProvider<CartCubit>(
      create: (_) => CartCubit(),
    ),
  ];
}
