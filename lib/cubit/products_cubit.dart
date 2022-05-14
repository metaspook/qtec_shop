import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/models/product.dart';
import 'package:qtec_shop/services/data_service.dart';

class ProductsCubit extends Cubit<List<Product>> {
  ProductsCubit() : super([]);
  final _dataService = DataService();

  Future<void> getProducts() async => emit(await _dataService.fetchProducts());
}
