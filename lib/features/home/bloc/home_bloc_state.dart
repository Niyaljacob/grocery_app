part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> product;
  HomeLoadedSuccessState({
    required this.product,
    });
}

class HomeErrorState extends HomeState{}

class  HomeNavigateTowishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}


class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}




