import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/models/models.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void add(Product product) => emit(state.contains(product) ? state : state
    ..add(product));
  void remove(Product product) => emit(state..remove(product));
  void removeCart() => emit(state..clear());
}
