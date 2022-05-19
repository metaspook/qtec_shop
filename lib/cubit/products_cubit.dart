import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/models/product.dart';
import 'package:qtec_shop/services/data_service.dart';

class ProductsCubit extends Cubit<List<Product>> {
  ProductsCubit() : super([]);
  final _dataService = DataService();
  int _offset = 10;

  void setOffset(int offset) => _offset = offset;
  Future<void> getProducts(int offset) async =>
      emit(await _dataService.fetchProducts(offset));
  // Future<void> getProducts() async =>
  //     emit(await _dataService.fetchProducts(_offset));
}
