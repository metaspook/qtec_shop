import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class BlocProviders {
  BlocProviders._();
  static final myApp = [
    BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit()..getProducts(),
    ),
  ];
}
