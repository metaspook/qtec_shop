import 'package:flutter_bloc/flutter_bloc.dart';

class CartCounterCubit extends Cubit<int> {
  CartCounterCubit() : super(0);

  void increment(int quantity) => emit(state + quantity);
  void decrement(int quantity) => emit(state > 0 ? state - quantity : state);
}
