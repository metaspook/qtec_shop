import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/models/product.dart';
import 'package:qtec_shop/services/data_service.dart';

class ProductsCubit extends Cubit<List<Product>> {
  ProductsCubit() : super([]);
  final _dataService = DataService();

  Future<void> getProducts({int offset = 0, String query = ''}) async {
    final products =
        await _dataService.fetchProducts(offset: offset, query: query);
    if (!listEquals<Product>(state, products)) emit(products);
  }
}
