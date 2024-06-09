import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart_tile.dart';
import 'package:grocery_app_bloc/features/home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvents());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listener: (context, state) {
          
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessSate:
            final successState = state as CartSuccessSate;
            return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index){
                  return CartTileWidget(
                    cartBloc: cartBloc,
                    productDataModel: successState.cartItems[index]);
                });
              
              
            default:
          }
          return Container();
        },
      ),
    );
  }
}
