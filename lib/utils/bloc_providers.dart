import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class BlocProviders {
  BlocProviders._();
  static final qtecShopApp = <BlocProvider>[
    BlocProvider<ProductsCubit>(
      create: (_) => ProductsCubit(),
    ),
    BlocProvider<SearchbarCubit>(
      create: (_) => SearchbarCubit(),
    ),
    BlocProvider<CartCubit>(
      create: (_) => CartCubit(),
    ),
  ];
}
