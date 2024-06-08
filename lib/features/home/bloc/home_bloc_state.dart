part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeBlocInitial extends HomeState {}
