import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc_bloc.dart';
import 'package:grocery_app_bloc/features/home/model/home_product_data.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBlocBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),

                ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${productDataModel.price}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickEvent(
                        //   clickedProduct: productDataModel
                        // ));
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black
                      )),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvents(
                          productDataModel: productDataModel,
                        ));

                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}