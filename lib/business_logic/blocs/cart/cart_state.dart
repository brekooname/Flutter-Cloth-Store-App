part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<Cloth> cloths;
  const CartLoaded({this.cloths = const []});

  double getTotal() => cloths.fold(0, (previousValue, element) => previousValue+element.price);

  @override
  List<Object> get props => [cloths];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}