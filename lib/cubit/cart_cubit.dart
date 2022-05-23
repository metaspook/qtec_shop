import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/models/models.dart';

class CartCubit extends Cubit<List<CartProduct>> {
  CartCubit() : super([]);
  static const _updateQuantity = 5;

  bool containsProductById(String productId) =>
      state.map<String>((e) => e.productId).contains(productId);
  int productId2CartIndex(String productId) =>
      state.indexWhere((e) => e.productId == productId.toString());
  CartProduct id2cartProduct(String productId) =>
      state.elementAt(productId2CartIndex(productId));

  void add(Product product) {
    if (!containsProductById(product.id)) {
      final cartProduct =
          CartProduct.fromProduct(product: product, quantity: _updateQuantity);
      emit([...state, cartProduct]);
    }
  }

  void remove(String productId) {
    if (containsProductById(productId)) {
      final cartProduct = id2cartProduct(productId);
      emit([...state..remove(cartProduct)]);
    }
  }

  void incrementQuantity(String productId) {
    final index = productId2CartIndex(productId);
    final cartProduct = id2cartProduct(productId);
    if (cartProduct.quantity != cartProduct.maxOrderQuantity) {
      state[index] = cartProduct.copyWith(
        quantity: cartProduct.quantity + _updateQuantity,
        subTotal: cartProduct.subTotal + cartProduct.unitPrice,
      );
      emit([...state]);
    }
  }

  void decrementQuantity(String productId) {
    final index = productId2CartIndex(productId);
    final cartProduct = id2cartProduct(productId);
    if (cartProduct.quantity != _updateQuantity) {
      // print('object');
      state[index] = cartProduct.copyWith(
        quantity: cartProduct.quantity - _updateQuantity,
        subTotal: cartProduct.subTotal - cartProduct.unitPrice,
      );
      emit([...state]);
    } else {
      remove(productId);
    }
  }

  void removeCart() => emit([...state..clear()]);
}
