part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class  CartInitialEvents extends CartBlocEvent{

}

class CartRemoveFromCartEvents extends CartBlocEvent{
  final ProductDataModel productDataModel;

  CartRemoveFromCartEvents({required this.productDataModel});
}
