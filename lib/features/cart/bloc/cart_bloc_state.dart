part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

abstract class CartActionState extends CartBlocState{}

final class CartBlocInitial extends CartBlocState {}

class CartSuccessSate extends CartBlocState{
  final List<ProductDataModel>cartItems;

  CartSuccessSate({required this.cartItems});
}
