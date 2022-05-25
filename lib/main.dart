import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/shop_app.dart';
import 'package:qtec_shop/utils/utils.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: BlocProviders.qtecShopApp,
      child: const ShopApp(),
    ),
  );
}
