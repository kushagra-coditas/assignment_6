import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderState {
  final int riceQuantity;
  final int vegQuantity;

   OrderState({this.riceQuantity = 1, this.vegQuantity = 1});
}

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier() : super(OrderState());

  void incrementRice() {
    state = OrderState(
      riceQuantity: state.riceQuantity + 1,
      vegQuantity: state.vegQuantity,
    );
  }

  void decrementRice() {
    state = OrderState(
      riceQuantity: state.riceQuantity > 0 ? state.riceQuantity - 1 : 0,
      vegQuantity: state.vegQuantity,
    );
  }

  void incrementVeg() {
    state = OrderState(
      riceQuantity: state.riceQuantity,
      vegQuantity: state.vegQuantity + 1,
    );
  }

  void decrementVeg() {
    state = OrderState(
      riceQuantity: state.riceQuantity,
      vegQuantity: state.vegQuantity > 0 ? state.vegQuantity - 1 : 0,
    );
  }
}

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>((ref) {
  return OrderNotifier();
});
