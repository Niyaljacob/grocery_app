import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc_bloc.dart';
import 'package:grocery_app_bloc/features/home/ui/product_tile_widget.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateTowishlistPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Wishlist()));
        }else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));
        }else if(state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item WishListed')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
          final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal[300],
                title: const Text(
                  'Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.product.length,
                itemBuilder: (context, index){
                  return ProductTileWidget(
                    homeBloc: homeBloc,
                    productDataModel: successState.product[index]);
                }),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
