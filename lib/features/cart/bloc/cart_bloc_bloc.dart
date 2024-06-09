import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/cart_items.dart';
import 'package:grocery_app_bloc/features/home/model/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInitialEvents>(cartInitialEvents);
    on<CartRemoveFromCartEvents>(cartRemoveFromCartEvents);
  }

  FutureOr<void> cartInitialEvents(CartInitialEvents event, Emitter<CartBlocState> emit) {
    emit(CartSuccessSate(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvents(CartRemoveFromCartEvents event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessSate(cartItems: cartItems));
  }
}
